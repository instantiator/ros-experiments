# Services

See: [Understanding ROS 2 services](https://docs.ros.org/en/foxy/Tutorials/Services/Understanding-ROS2-Services.html)

* Nodes communicate by request/response messages between _service client_ and _service server_.
* This is many:1 - ie. there can be multiple clients, but one server per service.

![Multiple service clients](images/Service-MultipleServiceClient.gif)

## View services

Launch `turtlesim turtlesim-node` and `turtlesim turtle_teleop_key`:

```bash
ros2 run turtlesim turtlesim_node &
ros2 run turtlesim turtle_teleop_key &
```

_NB. `turtle_teleop_key` requires stdin - so this may fail. You get the point though - run it in a separate process, as the next step explores the services available from each node..._

View all services:

```bash
$ ros2 service list
/clear
/kill
/reset
/spawn
/teleop_turtle/describe_parameters
/teleop_turtle/get_parameter_types
/teleop_turtle/get_parameters
/teleop_turtle/list_parameters
/teleop_turtle/set_parameters
/teleop_turtle/set_parameters_atomically
/turtle1/set_pen
/turtle1/teleport_absolute
/turtle1/teleport_relative
/turtlesim/describe_parameters
/turtlesim/get_parameter_types
/turtlesim/get_parameters
/turtlesim/list_parameters
/turtlesim/set_parameters
/turtlesim/set_parameters_atomically
```

## Service details

* Each service has a type.
* `ros2 service list -t` shows all service types (aka `--show-types`).
* Use `ros2 service type` to see the type of a specific service.

```bash
ros2 service type <service_name>
```

eg.

```bash
$ ros2 service type /clear
std_srvs/srv/Empty
```

This is the `Empty` type - it has no request or response data.

* A service type describes the type of the request and response.

```bash
ros2 interface show <type_name>.srv
```

eg.

```bash
$ ros2 interface show std_srvs/srv/Empty.srv
---
```

* Remember - this is the `Empty` service type.
* The `---` separates request (top) from response (bottom).

eg.

```bash
$ ros2 interface show turtlesim/srv/Spawn
float32 x
float32 y
float32 theta
string name # Optional.  A unique name will be created and returned if this is empty
---
string name
```

## Call a service

```bash
ros2 service call <service_name> <service_type> <arguments>
```

eg.

```bash
$ ros2 service call /clear std_srvs/srv/Empty
```

* The TurtleSim window clears any drawn lines.
* No return type.

eg.

```bash
$ ros2 service call /spawn turtlesim/srv/Spawn "{x: 2, y: 2, theta: 0.2, name: ''}"
requester: making request: turtlesim.srv.Spawn_Request(x=2.0, y=2.0, theta=0.2, name='')

response:
turtlesim.srv.Spawn_Response(name='turtle2')
```

* The spawn service creates a new turtle.
* Data in the arguments:
  * `x: 2`
  * `y: 2`
  * `theta: 0.2`
  * `name: ''` - this is left blank
* The response is a `Spawn_Response`, with `name='turtle2'`

> The formats are bizarre. The input looks a lot like JSON (but the documentation says YAML), and output is... a constructor? Get used to it I guess.

