# Topics

* Nodes communicate by sending messages through topics.
* A topic is like a message bus.
* It's a pub/sub model with many:many relationships.
* Messages are typed.
* Each topic has a specific message type.
* Nodes can publish messages to a topic.
* Nodes can subscribe to topics.

## Visualisation with rqt

Use `rqt` to view nodes, topics, services, actions in ROS.

```bash
rqt_graph
```

Or - launch `rqt` and choose Plugins > Introspection > Node Graph.

## Learn about topics

```bash
ros2 topic list
```

* `-t` appends the topic type to the list

eg.

```text
/parameter_events [rcl_interfaces/msg/ParameterEvent]
/rosout [rcl_interfaces/msg/Log]
/turtle1/cmd_vel [geometry_msgs/msg/Twist]
/turtle1/color_sensor [turtlesim/msg/Color]
/turtle1/pose [turtlesim/msg/Pose]
```

See what's published to a topic with `topic echo`:

```bash
ros2 topic echo <topic_name>
```

See info about the topic, such as the number of pubs and subs:

```bash
ros topic info <topic_name>
```

eg.

```bash
$ ros2 topic info /turtle1/cmd_vel
Type: geometry_msgs/msg/Twist
Publisher count: 1
Subscription count: 2
```

Learn about the interface:

```bash
$ ros2 interface show geometry_msgs/msg/Twist
This expresses velocity in free space broken into its linear and angular parts.

    Vector3  linear
    Vector3  angular
```

## Sending a message

You can publish directly to a topic using `ros2 topic pub` as:

```bash
ros2 topic pub <topic_name> <msg_type> '<args>'
```

The `args` argument is the data to be sent, and the documentation states it must be in _YAML_ format. (It looks a lot like _JSON_ in the example given, though...)

eg.

```bash
ros2 topic pub --once /turtle1/cmd_vel geometry_msgs/msg/Twist "{linear: {x: 2.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 1.8}}"
```

* `--once` - sends the message once and exits.
* `--rate 1` - sends the message indefinitely at a rate of 1 Hz.

You can see the rate at which messages are published to a particular topic with `ros2 topic hz` as:

```bash
ros2 topic hz <topic>
```

eg.

```bash
ros2 topic hz /turtle1/cmd_vel
ros2 topic hz /turtle1/pose
```

