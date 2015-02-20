# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "group_hw1: 1 messages, 1 services")

set(MSG_I_FLAGS "-Igroup_hw1:/home/fpereira/catkin_ws/src/group_hw1/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(group_hw1_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/fpereira/catkin_ws/src/group_hw1/msg/State.msg" NAME_WE)
add_custom_target(_group_hw1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "group_hw1" "/home/fpereira/catkin_ws/src/group_hw1/msg/State.msg" ""
)

get_filename_component(_filename "/home/fpereira/catkin_ws/src/group_hw1/srv/move_robot.srv" NAME_WE)
add_custom_target(_group_hw1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "group_hw1" "/home/fpereira/catkin_ws/src/group_hw1/srv/move_robot.srv" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(group_hw1
  "/home/fpereira/catkin_ws/src/group_hw1/msg/State.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/group_hw1
)

### Generating Services
_generate_srv_cpp(group_hw1
  "/home/fpereira/catkin_ws/src/group_hw1/srv/move_robot.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/group_hw1
)

### Generating Module File
_generate_module_cpp(group_hw1
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/group_hw1
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(group_hw1_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(group_hw1_generate_messages group_hw1_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fpereira/catkin_ws/src/group_hw1/msg/State.msg" NAME_WE)
add_dependencies(group_hw1_generate_messages_cpp _group_hw1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fpereira/catkin_ws/src/group_hw1/srv/move_robot.srv" NAME_WE)
add_dependencies(group_hw1_generate_messages_cpp _group_hw1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(group_hw1_gencpp)
add_dependencies(group_hw1_gencpp group_hw1_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS group_hw1_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(group_hw1
  "/home/fpereira/catkin_ws/src/group_hw1/msg/State.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/group_hw1
)

### Generating Services
_generate_srv_lisp(group_hw1
  "/home/fpereira/catkin_ws/src/group_hw1/srv/move_robot.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/group_hw1
)

### Generating Module File
_generate_module_lisp(group_hw1
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/group_hw1
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(group_hw1_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(group_hw1_generate_messages group_hw1_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fpereira/catkin_ws/src/group_hw1/msg/State.msg" NAME_WE)
add_dependencies(group_hw1_generate_messages_lisp _group_hw1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fpereira/catkin_ws/src/group_hw1/srv/move_robot.srv" NAME_WE)
add_dependencies(group_hw1_generate_messages_lisp _group_hw1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(group_hw1_genlisp)
add_dependencies(group_hw1_genlisp group_hw1_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS group_hw1_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(group_hw1
  "/home/fpereira/catkin_ws/src/group_hw1/msg/State.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/group_hw1
)

### Generating Services
_generate_srv_py(group_hw1
  "/home/fpereira/catkin_ws/src/group_hw1/srv/move_robot.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/group_hw1
)

### Generating Module File
_generate_module_py(group_hw1
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/group_hw1
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(group_hw1_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(group_hw1_generate_messages group_hw1_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fpereira/catkin_ws/src/group_hw1/msg/State.msg" NAME_WE)
add_dependencies(group_hw1_generate_messages_py _group_hw1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fpereira/catkin_ws/src/group_hw1/srv/move_robot.srv" NAME_WE)
add_dependencies(group_hw1_generate_messages_py _group_hw1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(group_hw1_genpy)
add_dependencies(group_hw1_genpy group_hw1_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS group_hw1_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/group_hw1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/group_hw1
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(group_hw1_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/group_hw1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/group_hw1
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(group_hw1_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/group_hw1)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/group_hw1\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/group_hw1
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(group_hw1_generate_messages_py std_msgs_generate_messages_py)
