; Auto-generated. Do not edit!


(cl:in-package group_hw1-srv)


;//! \htmlinclude move_robot-request.msg.html

(cl:defclass <move_robot-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:integer
    :initform 0)
   (target
    :reader target
    :initarg :target
    :type cl:integer
    :initform 0))
)

(cl:defclass move_robot-request (<move_robot-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <move_robot-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'move_robot-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name group_hw1-srv:<move_robot-request> is deprecated: use group_hw1-srv:move_robot-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <move_robot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader group_hw1-srv:command-val is deprecated.  Use group_hw1-srv:command instead.")
  (command m))

(cl:ensure-generic-function 'target-val :lambda-list '(m))
(cl:defmethod target-val ((m <move_robot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader group_hw1-srv:target-val is deprecated.  Use group_hw1-srv:target instead.")
  (target m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <move_robot-request>) ostream)
  "Serializes a message object of type '<move_robot-request>"
  (cl:let* ((signed (cl:slot-value msg 'command)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'target)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <move_robot-request>) istream)
  "Deserializes a message object of type '<move_robot-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'target) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<move_robot-request>)))
  "Returns string type for a service object of type '<move_robot-request>"
  "group_hw1/move_robotRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'move_robot-request)))
  "Returns string type for a service object of type 'move_robot-request"
  "group_hw1/move_robotRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<move_robot-request>)))
  "Returns md5sum for a message object of type '<move_robot-request>"
  "ae646fe5fb39d5a27e6b0cd44ed9a25e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'move_robot-request)))
  "Returns md5sum for a message object of type 'move_robot-request"
  "ae646fe5fb39d5a27e6b0cd44ed9a25e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<move_robot-request>)))
  "Returns full string definition for message of type '<move_robot-request>"
  (cl:format cl:nil "int64 command~%int64 target~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'move_robot-request)))
  "Returns full string definition for message of type 'move_robot-request"
  (cl:format cl:nil "int64 command~%int64 target~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <move_robot-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <move_robot-request>))
  "Converts a ROS message object to a list"
  (cl:list 'move_robot-request
    (cl:cons ':command (command msg))
    (cl:cons ':target (target msg))
))
;//! \htmlinclude move_robot-response.msg.html

(cl:defclass <move_robot-response> (roslisp-msg-protocol:ros-message)
  ((valid_action
    :reader valid_action
    :initarg :valid_action
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass move_robot-response (<move_robot-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <move_robot-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'move_robot-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name group_hw1-srv:<move_robot-response> is deprecated: use group_hw1-srv:move_robot-response instead.")))

(cl:ensure-generic-function 'valid_action-val :lambda-list '(m))
(cl:defmethod valid_action-val ((m <move_robot-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader group_hw1-srv:valid_action-val is deprecated.  Use group_hw1-srv:valid_action instead.")
  (valid_action m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <move_robot-response>) ostream)
  "Serializes a message object of type '<move_robot-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'valid_action) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <move_robot-response>) istream)
  "Deserializes a message object of type '<move_robot-response>"
    (cl:setf (cl:slot-value msg 'valid_action) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<move_robot-response>)))
  "Returns string type for a service object of type '<move_robot-response>"
  "group_hw1/move_robotResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'move_robot-response)))
  "Returns string type for a service object of type 'move_robot-response"
  "group_hw1/move_robotResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<move_robot-response>)))
  "Returns md5sum for a message object of type '<move_robot-response>"
  "ae646fe5fb39d5a27e6b0cd44ed9a25e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'move_robot-response)))
  "Returns md5sum for a message object of type 'move_robot-response"
  "ae646fe5fb39d5a27e6b0cd44ed9a25e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<move_robot-response>)))
  "Returns full string definition for message of type '<move_robot-response>"
  (cl:format cl:nil "bool valid_action~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'move_robot-response)))
  "Returns full string definition for message of type 'move_robot-response"
  (cl:format cl:nil "bool valid_action~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <move_robot-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <move_robot-response>))
  "Converts a ROS message object to a list"
  (cl:list 'move_robot-response
    (cl:cons ':valid_action (valid_action msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'move_robot)))
  'move_robot-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'move_robot)))
  'move_robot-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'move_robot)))
  "Returns string type for a service object of type '<move_robot>"
  "group_hw1/move_robot")