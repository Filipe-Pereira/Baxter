
(cl:in-package :asdf)

(defsystem "group_hw1-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "move_robot" :depends-on ("_package_move_robot"))
    (:file "_package_move_robot" :depends-on ("_package"))
  ))