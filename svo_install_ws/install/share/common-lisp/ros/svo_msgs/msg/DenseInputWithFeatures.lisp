; Auto-generated. Do not edit!


(cl:in-package svo_msgs-msg)


;//! \htmlinclude DenseInputWithFeatures.msg.html

(cl:defclass <DenseInputWithFeatures> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (frame_id
    :reader frame_id
    :initarg :frame_id
    :type cl:integer
    :initform 0)
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (image
    :reader image
    :initarg :image
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (min_depth
    :reader min_depth
    :initarg :min_depth
    :type cl:float
    :initform 0.0)
   (max_depth
    :reader max_depth
    :initarg :max_depth
    :type cl:float
    :initform 0.0)
   (features
    :reader features
    :initarg :features
    :type (cl:vector svo_msgs-msg:Feature)
   :initform (cl:make-array 0 :element-type 'svo_msgs-msg:Feature :initial-element (cl:make-instance 'svo_msgs-msg:Feature))))
)

(cl:defclass DenseInputWithFeatures (<DenseInputWithFeatures>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DenseInputWithFeatures>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DenseInputWithFeatures)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name svo_msgs-msg:<DenseInputWithFeatures> is deprecated: use svo_msgs-msg:DenseInputWithFeatures instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <DenseInputWithFeatures>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svo_msgs-msg:header-val is deprecated.  Use svo_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'frame_id-val :lambda-list '(m))
(cl:defmethod frame_id-val ((m <DenseInputWithFeatures>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svo_msgs-msg:frame_id-val is deprecated.  Use svo_msgs-msg:frame_id instead.")
  (frame_id m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <DenseInputWithFeatures>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svo_msgs-msg:pose-val is deprecated.  Use svo_msgs-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'image-val :lambda-list '(m))
(cl:defmethod image-val ((m <DenseInputWithFeatures>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svo_msgs-msg:image-val is deprecated.  Use svo_msgs-msg:image instead.")
  (image m))

(cl:ensure-generic-function 'min_depth-val :lambda-list '(m))
(cl:defmethod min_depth-val ((m <DenseInputWithFeatures>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svo_msgs-msg:min_depth-val is deprecated.  Use svo_msgs-msg:min_depth instead.")
  (min_depth m))

(cl:ensure-generic-function 'max_depth-val :lambda-list '(m))
(cl:defmethod max_depth-val ((m <DenseInputWithFeatures>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svo_msgs-msg:max_depth-val is deprecated.  Use svo_msgs-msg:max_depth instead.")
  (max_depth m))

(cl:ensure-generic-function 'features-val :lambda-list '(m))
(cl:defmethod features-val ((m <DenseInputWithFeatures>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader svo_msgs-msg:features-val is deprecated.  Use svo_msgs-msg:features instead.")
  (features m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DenseInputWithFeatures>) ostream)
  "Serializes a message object of type '<DenseInputWithFeatures>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'frame_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'frame_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'frame_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'frame_id)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'image) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'min_depth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_depth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'features))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'features))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DenseInputWithFeatures>) istream)
  "Deserializes a message object of type '<DenseInputWithFeatures>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'frame_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'frame_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'frame_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'frame_id)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'image) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'min_depth) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_depth) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'features) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'features)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'svo_msgs-msg:Feature))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DenseInputWithFeatures>)))
  "Returns string type for a message object of type '<DenseInputWithFeatures>"
  "svo_msgs/DenseInputWithFeatures")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DenseInputWithFeatures)))
  "Returns string type for a message object of type 'DenseInputWithFeatures"
  "svo_msgs/DenseInputWithFeatures")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DenseInputWithFeatures>)))
  "Returns md5sum for a message object of type '<DenseInputWithFeatures>"
  "8766f81be9c5b79c57cfdc4197e0a3a2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DenseInputWithFeatures)))
  "Returns md5sum for a message object of type 'DenseInputWithFeatures"
  "8766f81be9c5b79c57cfdc4197e0a3a2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DenseInputWithFeatures>)))
  "Returns full string definition for message of type '<DenseInputWithFeatures>"
  (cl:format cl:nil "Header header~%uint32 frame_id~%geometry_msgs/Pose pose~%sensor_msgs/Image image~%float32 min_depth~%float32 max_depth~%svo_msgs/Feature[] features~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: svo_msgs/Feature~%float32 x # x component of 3d point in camera frame~%float32 y # y component of 3d point in camera frame~%float32 z # z component of 3d point in camera frame ~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DenseInputWithFeatures)))
  "Returns full string definition for message of type 'DenseInputWithFeatures"
  (cl:format cl:nil "Header header~%uint32 frame_id~%geometry_msgs/Pose pose~%sensor_msgs/Image image~%float32 min_depth~%float32 max_depth~%svo_msgs/Feature[] features~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: svo_msgs/Feature~%float32 x # x component of 3d point in camera frame~%float32 y # y component of 3d point in camera frame~%float32 z # z component of 3d point in camera frame ~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DenseInputWithFeatures>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'image))
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'features) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DenseInputWithFeatures>))
  "Converts a ROS message object to a list"
  (cl:list 'DenseInputWithFeatures
    (cl:cons ':header (header msg))
    (cl:cons ':frame_id (frame_id msg))
    (cl:cons ':pose (pose msg))
    (cl:cons ':image (image msg))
    (cl:cons ':min_depth (min_depth msg))
    (cl:cons ':max_depth (max_depth msg))
    (cl:cons ':features (features msg))
))
