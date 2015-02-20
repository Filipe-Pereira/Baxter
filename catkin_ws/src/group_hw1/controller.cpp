#include <ros/ros.h>
#include <group_hw1/move_robot.h>
#include <stdlib.h>
#include <group_hw1/State.h>
#include <std_msgs/String.h>
#include <string>
std:: string blocks;
std::string command;

void getState ( const group_hw1::State& msg)
{
	blocks=msg.blocks;
}

void getCommand( const std_msgs::String& msg)
{
	command=msg.data;	
}

int main (int argc, char** argv) {
	
	ros::init (argc, argv, "controller");
	ros::NodeHandle nh;
	std::string config;
	//Service client
	ros::ServiceClient client =nh.serviceClient <group_hw1::move_robot>("move_robot");
	group_hw1::move_robot::Request req;
	group_hw1::move_robot::Response resp;
	
	//Getting the number of blocks
	int num_blocks;
	bool ok=ros::param::get("/num_blocks",num_blocks);
	if (!ok) {
	 	ROS_FATAL_STREAM ("Could not get parameter" << " num_blocks");
		exit(1);
	}
	
	//Subscribing to group_hw1/state
	ros::Subscriber sub_state = nh.subscribe("group_hw1/state",1000, &getState);	
	
	//Subscribing to group_hw1/command
	ros::Subscriber sub_command = nh.subscribe("group_hw1/command",1000, &getCommand);	
	
	bool ret=ros::param::get("/configuration",config);
        if (!ret) {
              ROS_FATAL_STREAM ("Could not get parameter" << " configuration");
	      exit(1);
	}
	ros::Rate rate(2);
	while(ros::ok())
	{
	    ros::spinOnce (); //getting the state in blocks

	    if ( (!command.compare("scattered") || !command.compare("stacked_ascending")||!command.compare("stacked_descending")) &&  (config.compare(command) != 0 ))
	    {
		ROS_INFO_STREAM ("Starting to move the blocks");
	      	ROS_INFO_STREAM (command);

		//Scattering
		int aux1;
		std::string current_block;
		int current_block_number;
		//Deleting the 0| of blocks
		blocks.erase(blocks.find("g"),1);	
		while (blocks.find("|0|")!=-1) {blocks.erase (blocks.find("|0|"),2);}
		blocks.erase(blocks.length()-1,1);
		blocks.erase (0,2);
		ROS_INFO_STREAM (blocks);
		
	
		while (blocks.length()>0)
		{
			
			//Getting the last number of blocks
			aux1= blocks.find_last_of ("|")	;	
			current_block = blocks.substr(aux1+1,blocks.length()-aux1-1 );
			ROS_INFO_STREAM (current_block);
		
			//Converting current_block to number
			std::stringstream convert(current_block);
			convert>>current_block_number;	

			req.command= 0;
			bool success = client.call(req,resp);
			if (!resp.valid_action) ROS_ERROR_STREAM("Not valid action0"); 			
			if (!success) ROS_ERROR_STREAM("Failed to spawn");
		
			req.command= 2;
			req.target = current_block_number;
			success = client.call(req,resp);
			if (!resp.valid_action) ROS_ERROR_STREAM("Not valid action1"); 			
			if (!success) ROS_ERROR_STREAM("Failed to spawn");
			
			req.command= 1;
			success = client.call(req,resp);
			if (!resp.valid_action) ROS_ERROR_STREAM("Not valid action2"); 			
			if (!success) ROS_ERROR_STREAM("Failed to spawn");
		
			req.command= 3;
			req.target =0;
			success = client.call(req,resp);
			if (!resp.valid_action) ROS_ERROR_STREAM("Not valid action3"); 			
			if (!success) ROS_ERROR_STREAM("Failed to spawn");
		
			//Reducing the size of the queue of blocks
			ROS_INFO_STREAM (blocks.find(current_block));			
			blocks.erase (blocks.find(current_block),current_block.length());
			
			ROS_INFO_STREAM (blocks);	
			if (blocks.length()>0)	blocks.erase(blocks.length()-1,1);	
			
			ROS_INFO_STREAM (command);	
					
		}

		if (!command.compare("stacked_ascending"))
		{
			for (int i=1; i<=num_blocks;i++)
			{
				req.command= 0;
	 			bool success = client.call(req,resp);
				if (!resp.valid_action) ROS_ERROR_STREAM("Not valid action0"); 			
				if (!success) ROS_ERROR_STREAM("Failed to spawn");
			
				req.command= 2;
				req.target = i;
				success = client.call(req,resp);
				if (!resp.valid_action) ROS_ERROR_STREAM("Not valid action1"); 			
				if (!success) ROS_ERROR_STREAM("Failed to spawn");
				
				req.command= 1;
				success = client.call(req,resp);
				if (!resp.valid_action) ROS_ERROR_STREAM("Not valid action2"); 			
				if (!success) ROS_ERROR_STREAM("Failed to spawn");
			
				req.command= 3;
				req.target =i-1;
				success = client.call(req,resp);
				if (!resp.valid_action) {ROS_ERROR_STREAM("Not valid action3"); ROS_ERROR_STREAM(i);} 			
				if (!success) ROS_ERROR_STREAM("Failed to spawn");
			
			}		
		}

		if ( !command.compare("stacked_descending"))
		{
			for (int i=num_blocks; i>=1;i--)
			{
				req.command= 0;
	 			bool success = client.call(req,resp);
				if (!resp.valid_action) ROS_ERROR_STREAM("Not valid action0"); 			
				if (!success) ROS_ERROR_STREAM("Failed to spawn");
			
				req.command= 2;
				req.target = i;
				success = client.call(req,resp);
				if (!resp.valid_action) ROS_ERROR_STREAM("Not valid action1"); 			
				if (!success) ROS_ERROR_STREAM("Failed to spawn");
				
				req.command=1;
				success = client.call(req,resp);
				if (!resp.valid_action) ROS_ERROR_STREAM("Not valid action2"); 			
				if (!success) ROS_ERROR_STREAM("Failed to spawn");
			
				req.command= 3;
				if(i==num_blocks) req.target =0;
				else	req.target =i+1;
				success = client.call(req,resp);
				if (!resp.valid_action) ROS_ERROR_STREAM("Not valid action3"); 			
				if (!success) ROS_ERROR_STREAM("Failed to spawn");
		
			}	
		}
	
	        config = command;
		ROS_INFO_STREAM ("Task completed!");
	    } 

	}	 
			
}
