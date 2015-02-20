#include <ros/ros.h>
#include <group_hw1/move_robot.h>
#include <group_hw1/State.h>
#include <stdlib.h>
#include <string>
#include <iostream>

//Global variables (to be used by the callback function)
std::string blocks ; //string containing the order of the blocks
bool gripper_open =true;


bool callback_server (group_hw1::move_robot::Request &req, group_hw1::move_robot::Response &resp){
	
	std::string block_to_find;	

	//Obtaining the position of the block in blocks
	std::string converted; //to convert number->string
	std::ostringstream convert;
	convert <<req.target;
	converted = convert.str() ;
	converted.append("|"); //string containing the current target block
	block_to_find ="|";
	block_to_find.append(converted);
	
	int block_position = blocks.find(block_to_find) +1 ; //The first element is "|"
 	   
        //ROS_INFO_STREAM(converted);
	//ROS_INFO_STREAM(block_position);
        //ROS_INFO_STREAM(blocks);
	
	//Obtaining the position of the gripper
	int gripper_position =blocks.find("g");
	//ROS_INFO_STREAM(block_position);
        //ROS_INFO_STREAM(gripper_position);
		

	//Interpreting the req.command
	switch (req.command){
	
		case 0: 
			//Open gripper
			gripper_open=true;
			resp.valid_action = true;				
			break;
		case 1: 
			//Close gripper
			gripper_open=false;
			resp.valid_action = true;			
			break;
		case 2: 
			//Move to a block
			if (!gripper_open) resp.valid_action = false;
			else
			{
				//Move the gripper to the right of the req.target
				blocks.erase(gripper_position,1);	
				block_position = blocks.find(block_to_find)+1;
				blocks.insert(block_position + converted.length(),"g");
				
				int aux = blocks.find("|0|0|");
				if(aux!=-1) blocks.erase (aux,2);
			        aux=blocks.find("0|0|");
				if(aux==0) blocks.erase (aux,2);
				aux=blocks.find("g0|0|");
				if(aux!=-1) blocks.erase (aux+1,2);
						
												
				resp.valid_action = true;
			}
			
			break;
		case 3:
			//Move over a block
			if (gripper_open ) resp.valid_action = false;
			else
			{

								
				//if (blocks[gripper_position - 2]=='0' || blocks[gripper_position+1]!='0' ) resp.valid_action = false;
				if (gripper_position==2 || blocks[gripper_position+1]!='0' ) resp.valid_action = false;
				else
				{
					//The gripper is holding some block in the top of the stack

					//Verifying if the target block is in the top of the stack
					if ( blocks[block_position + converted.length()] != '0' && req.target!=0) 
						resp.valid_action = false;
					else
					{
						//Moving the block
						std::string block_to_be_moved;
						int i=gripper_position-2;
						while ( blocks[i] != '|') {i--;}
						block_to_be_moved= blocks.substr(i+1,gripper_position - i); 
						//ROS_INFO_STREAM(block_to_be_moved);
						blocks.erase(i+1,gripper_position -i);
						
						//if (block_position!=0)
						if (converted.compare("0|"))						
						{
							block_position = blocks.find(block_to_find)+1;
							blocks.insert(block_position + converted.length(),block_to_be_moved);	
						}
						else
						{ 	
							//The target is the table (0)
							blocks.append(block_to_be_moved);
							blocks.append("0|");
						}
						
						//Organizing the string
						int aux = blocks.find("|0|0|");
						if(aux!=-1) blocks.erase (aux,2);
						aux=blocks.find("0|0|");
						if(aux==0) blocks.erase (aux,2);
						aux=blocks.find("g0|0|");
						if(aux!=-1) blocks.erase (aux+1,2);
							
						resp.valid_action = true;
			
					}
					

				}
			}					
			break;	
	}
	return true;
	
}

int main (int argc, char **argv){
	ros::init(argc, argv, "sim_master");
	ros::NodeHandle nh;
	std::string config;
	//Aux variable to convert number to strings
	std::string converted;

	//Getting the initial parameters "num_blocks" and "configuration" defined in the launch file
	int num_blocks;

	bool ok=ros::param::get("/num_blocks",num_blocks);
	if (!ok) {
	 	ROS_FATAL_STREAM ("Could not get parameter" << " num_blocks");
		exit(1);
	}

	ok=ros::param::get("/configuration",config);
	if (!ok) {
		ROS_FATAL_STREAM ("Could not get parameter" << " configuration");
		exit(1);
	}		
	
	//Initializing the world state according to the parameters received
	//std::string blocks ("0|") ; //string containing the order of the blocks
	blocks = "0|g";	

	if (!config.compare("scattered"))
	{
	   for (int i=1;i<=num_blocks;i++)
	   {
		blocks.append("0|");		
		std::ostringstream convert;
		convert <<i;
		converted = convert.str() ;
		blocks.append(converted);
		blocks.append("|");
	   }
	}

	if (!config.compare("stacked_ascending"))
	{
	   for (int i=1;i<=num_blocks;i++)
	   {
		std::ostringstream convert;
		convert <<i;
		converted = convert.str() ;
		blocks.append(converted);
		blocks.append("|");	
	   }  
	}
	
	if (!config.compare("stacked_descending"))
	{
	   for (int i=num_blocks;i>=1;i--)
	   {
		std::ostringstream convert;
		convert <<i;
		converted = convert.str() ;
		blocks.append(converted);
		blocks.append("|");
	   }	  
	}
		
	blocks.append("0|");  //The sequence always ends with a 0|
	
	//Register the service with the master
	ros::ServiceServer server =nh.advertiseService ("move_robot", &callback_server);
	
	//Publish the state with a given frequency until the node shuts down,
	//in the topic /state

	ros::Publisher pub = nh.advertise<group_hw1::State>("group_hw1/state", 1000);
	ros::Rate rate(1);
	
	while(ros::ok()){
	  
          
          group_hw1::State msg;
	  //Complete the object

	  msg.blocks = blocks;
	  msg.gripper_open = gripper_open;
	  pub.publish (msg);

	  //Receive requests from the client nodes
	  ros::spinOnce ();
	  rate.sleep ();
	
	}
} 
		
