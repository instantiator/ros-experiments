# Introduction to ROS 2

## The ROS (2) graph

![The ROS (2) graph](images/Nodes-TopicandService.gif)

### Nodes

* The base unit of everything in ROS.
* Each node represents a device or algorithm (these are tasks).
* Nodes communicate with other nodes by topic, service, actions or parameters.
 
### Topics

* A data stream for exchanging information, eg. sensor reading, or targets for motors.
* Each topic has a unique name, and a defined data type.
* NB. A node cannot publish and subscribe to the same topic at the same time.

### Packages

* For doing a single type of task.
* Can contain multiple nodes.

### Services

* A node can register a service.
* Other nodes can communicate with a service by request/response.
* This allows 2-way communication (because requests can contain data).

### Actions

### Parameters

## ROS 2 basics

### Launching executables

Launch an executable from a package:

```bash
ros2 run <package_name> <executable_name>
```

eg.

```bash
ros2 run turtlesim turtlesim_node
```

## Nodes

### List

```bash
ros2 node list
```

### Remap

```bash
ros2 run turtlesim turtlesim_node --ros-args --remap __node:=my_turtle
```

### Node info

```bash
ros2 node info <node_name>
```

Returns a list of subscribers, publishers, services, and actions that interact with the node.

eg.

```text
/my_turtle
  Subscribers:
    /parameter_events: rcl_interfaces/msg/ParameterEvent
    /turtle1/cmd_vel: geometry_msgs/msg/Twist
  Publishers:
    /parameter_events: rcl_interfaces/msg/ParameterEvent
    /rosout: rcl_interfaces/msg/Log
    /turtle1/color_sensor: turtlesim/msg/Color
    /turtle1/pose: turtlesim/msg/Pose
  Services:
    /clear: std_srvs/srv/Empty
    /kill: turtlesim/srv/Kill
    /reset: std_srvs/srv/Empty
    /spawn: turtlesim/srv/Spawn
    /turtle1/set_pen: turtlesim/srv/SetPen
    /turtle1/teleport_absolute: turtlesim/srv/TeleportAbsolute
    /turtle1/teleport_relative: turtlesim/srv/TeleportRelative
    /my_turtle/describe_parameters: rcl_interfaces/srv/DescribeParameters
    /my_turtle/get_parameter_types: rcl_interfaces/srv/GetParameterTypes
    /my_turtle/get_parameters: rcl_interfaces/srv/GetParameters
    /my_turtle/list_parameters: rcl_interfaces/srv/ListParameters
    /my_turtle/set_parameters: rcl_interfaces/srv/SetParameters
    /my_turtle/set_parameters_atomically: rcl_interfaces/srv/SetParametersAtomically
  Action Servers:
    /turtle1/rotate_absolute: turtlesim/action/RotateAbsolute
  Action Clients:
```
