# Topics

* Pub/Sub model in many:many relationships.

## Visualisations

### rqt

```bash
rqt_graph
```

Or - launch `rqt` and choose Plugins > Introspection > Node Graph.

### Topics

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

See info about the topic:

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
ros2 interface show geometry_msgs/msg/Twist

This expresses velocity in free space broken into its linear and angular parts.

    Vector3  linear
    Vector3  angular
```

