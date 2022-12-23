# Kramer VP-Series Control Protocol Definitions

A collection of the RS-232 Serial (and serial-over-ethernet or serial-over-IR) protocol specs JSON format, so they can be easily used in any project.

## Structure

### Files
[vp-7xx.json](./vp-7xx.json): command definitions for VP-719 through -724 (and will probably work for other -7xx models). **This is probably the file you want to use.**

[vp-7xx.md](./vp-7xx.md): A markdown version of the commands in the json file, for use by silly humans with silly eyes who need to read things.

[generator.rb](./generator.rb): ruby source files used to generate the above JSON and Markdown.

### Command Objects in Files

The command files are an array of JSON object, and every object looks like this:

```json
{
    "comments" : "VGA-2 is VP-724 Only",
    "control_type" : {
        "get" : 4,
        "set" : 3
    },
    "description" : "Select Input Source",
    "group": null,
    "function_code" : 0,
    "response_values" : {
        "0" : "VGA-1",
        "1" : "VGA-2",
        "2" : "DVI",
        "3" : "Component",
        "4" : "YC-1",
        "5" : "AV-1",
        "6" : "YV-2",
        "7" : "AV-2",
        "8" : "Scart",
        "9" : "TV"
    },
    "set_parameters" : [
        "integer",
        0,
        9
    ]
  }
```

The properties in each object are:

* comments
  - comments about the command, such as compatibility
* control_type
  - defines the codes used to **set** or **get** the function value on the device
  - if a command can only be used to _set_, then the `get` property will be `null'
  - likewise, if a command can only be used to _get_, then the `set` property will be `null'
* description
  - description of the command
* group
  - functional grouping, if applicable
* function_code
  - the function code to be passed to the device, along with the control type
* response_values
  - if the command returns a value, this is a dictionary of what the returned values mean
* set_parameters
  - if the function value can be set, these are the constraints for the parameters to be passed to the device
    * `null` - no parameters required
    * `["integer", x, y]`: an integer within the range of _x_ and _y_ inclusive
    * `["gt", x]`: an integer that is greater than _x_
    * `"any"`: any numeric value allowed, but see comments for details
  - parameters are only used for **set** operations, _not for get operations_

## Communication Parameters

For RS-232 connections, the serial port configuration is:
  * 9600 baud
  * 8 data bits
  * no parity
  * 1 stop bit

The serial port on most devices is wired as DTE, so you will need to use a null-modem adapter to connect it to a PC.

The docs say that all commands are specified to end with a "carriage return", although a unix-style "\n" seems to work just fine as well.

### Sending GET commands
To send a GET command, the format is: `Y {{control type for GET}} {{function code}}`

There is a _single space_ between each item.

### Sending SET commands
To send a SET command, the format is: `Y {{control type for SET}} {{function code}} {{parameter}}`

There is a _single space_ between each item.

If the command was successful, `done\n` will be returned from the device, followed by the GET response. 

### Reading responses

In addition to sending "done" for a _set_ command, all successful commands will return a response formatted as: `Z {{control type}} {{function code}} {{response value}}`

If the command has a dictionary of response values, use that to look up the meaning. If there is no dictionary, then the value is meant to be used directly or as described by the command comments.

The response is ended when the device sends `>`, and is then ready to receive a new command. 

## Protocol Version

This definition is derived from the [Kramer RS-232 Command Set documentation](https://cdn.kramerav.com/web/downloads/protocols/vp-719xl_720xl_vp-724xl_protocol.pdf). This is the so-called "New" protocol for devices with firmware > KB2.33. Devices with previous firmware use the ["Old" protocol](https://k.kramerav.com/downloads/protocols/vp-723xl.pdf) which is not (yet) included here.

It should also work for later models of the same family, [like VP-730/-731](https://www.audiogeneral.com/kramer/vp731_rs232.pdf), but has not been tested.

## Device Compatibility

This version currently has support for the protocol used in the VP-719, -720, -723, and -724 DS and XL Presentation Switcher/Scaler devices. It will also work for rebranded equivalent models

Kramer   | Ocean Matrix | BTX      | Notes
---------|--------------|----------|-----------------------
VP-719   | OMX-7190A    | BTX-719  |
VP-720   | OMX-7200A    |          |
VP-723   |              |          |
VP-724   | OMX-7240A    |          |
VP-7xx   |              |          | Should work, untested

# License

Unless otherwise encumbered, all work herein is licensed under [GNU LGPL-3.0](https://www.gnu.org/licenses/lgpl-3.0.en.html).