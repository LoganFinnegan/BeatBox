# Beat Box

## Iteration 1 – Node Basics

Our Linked List will ultimately be composed of individual nodes, so in this iteration we’ll start with building out these nodes. Note that they are quite simple – a Node simply needs to have a slot for some data and a slot for a “next node”. Eventually this `next_node` position will be what we use to link the multiple nodes together to form the list.

For this iteration, build a simple `Node` class that can perform these functions:

```ruby 
pry(main)> require "./lib/node"
#=> true

pry(main)> node = Node.new("plop")
#=> #<Node:0x007fbda8a88348 @data="plop", @next_node=nil>

pry(main)> node.data
#=> "plop"

pry(main)> node.next_node
#=> nil
```
# Append, To String, and Count (Single Node / Element)

Great! We have nodes. In this iteration we’ll create the `LinkedList` class and begin adding the basic functionality needed to append our first node.

We’ll be adding the following methods:

- **append** — creates a new node with the data passed into the method and adds it to the end of the linked list  
- **count** — returns how many nodes are in the list  
- **to_string** — returns a string containing the data from every node in the list, separated by spaces  

For this iteration, focus on building these methods so they work for **just the first element** appended to the list. Handling multiple elements will come in the next iteration.

## Expected Behavior

```ruby
pry(main)> require "./lib/linked_list"
#=> true

pry(main)> require "./lib/node"
#=> true

pry(main)> list = LinkedList.new
#=> #<LinkedList:0x000000010d670c88 @head=nil>

pry(main)> list.head
#=> nil

pry(main)> list.append("doop")

pry(main)> list
#=> #<LinkedList:0x0000000110e383a0 @head=#<Node:0x0000000110e382d8 @data="doop", @next_node=nil>>

pry(main)> list.head.data
#=> "doop"

pry(main)> list.head.next_node
#=> nil

pry(main)> list.count
#=> 1

pry(main)> list.to_string
#=> "doop"
```

# Append, All/To String, and Insert (Multiple Nodes)

Now that we can insert the first element of our list (the Head), we can extend our functionality to support multiple nodes. This iteration is where you will build out the core structure of your linked list, so expect it to take more time than the previous ones.

Update your `append`, `count`, and `to_string` methods so they support lists containing multiple elements. Once those are working, you will implement `insert`, which allows you to add a node at a specific position in the list.

## Expected Interaction Pattern

```ruby 
pry(main)> require "./lib/linked_list"
#=> true

pry(main)> require "./lib/node"
#=> true

pry(main)> list = LinkedList.new
#=> #<LinkedList:0x000000010d670c88 @head=nil>

pry(main)> list.head
#=> nil

pry(main)> list.append("doop")
#=> "doop"

pry(main)> list
#=> #<LinkedList:0x0000000110e383a0 @head=#<Node:0x0000000110e382d8 @data="doop", @next_node=nil>>

pry(main)> list.head
#=> #<Node:0x0000000110e382d8 @data="doop", @next_node=nil>

pry(main)> list.head.next_node
#=> nil

pry(main)> list.append("deep")

pry(main)> list
#=> #<LinkedList:0x00000001116213a0 @head=#<Node:0x00000001116212b0 @data="doop" @next_node=#<Node:0x00000001116210f8 @data="deep", @next_node=nil>>>

pry(main)> list.head.next_node
#=> #<Node:0x00000001116210f8 @data="deep", @next_node=nil>

pry(main)> list.count
#=> 2

pry(main)> list.to_string
#=> "doop deep"
```
Notice the key point here – the first piece of data we append becomes the Head, while the second becomes the Next Node of that (Head) node.

## Iteration 2  
### Additional Methods — insert and prepend

Now we have nodes and a `LinkedList` class that manages the list. The next step is to add the `insert` and `prepend` methods.

- **prepend** will add nodes to the beginning of the list.  
- **insert** will insert one or more elements at a given position in the list.  
  - It takes two parameters:  
    1. The position at which to insert nodes  
    2. The string of data to be inserted

## Expected Behavior

```ruby
pry(main)> require "./lib/linked_list"
#=> true

pry(main)> require "./lib/node"
#=> true

pry(main)> list = LinkedList.new
#=> #<LinkedList:0x000000010d670c88 @head=nil>

pry(main)> list.append("plop")

pry(main)> list.to_string
#=> "plop"

pry(main)> list.append("suu")

pry(main)> list.to_string
# "plop suu"

pry(main)> list.prepend("dop")

pry(main)> list.to_string
#=> "dop plop suu"

pry(main)> list.count
#=> 3

pry(main)> list.insert(1, "woo")

pry(main)> list.to_string
#=> "dop woo plop suu"
```
# Additional Methods - find, pop, includes?

find takes two parameters: the first indicates the starting position, and the second specifies how many elements to return.

includes? returns true or false depending on whether the supplied value is in the list.

pop removes the last element from the list and returns it.

## Expected Behavior

```ruby 
pry(main)> list.to_string
#=> "deep woo shi shu blop"

pry(main)> list.find(2, 1)
#=> "shi" 

pry(main)> list.find(1, 3)
#=> "woo shi shu"

pry(main)> list.includes?("deep")
#=> true

pry(main)> list.includes?("dep")
#=> false

pry(main)> list.pop
#=> "blop"

pry(main)> list.pop
#=> "shu"

pry(main)> list.to_string
#=> "deep woo shi"
``` 
## Iteration 3  
### Creating the BeatBox Linked List “Wrapper”

When we create a new instance of the `BeatBox` class, a `LinkedList` object is also instantiated and available as an attribute on the `BeatBox` instance. This allows us to manage our linked list through the `BeatBox` class.

Until now, the `LinkedList` class only accepted a single piece of data at a time. Passing a string like `"deep bop dop"` to `append` resulted in a single node containing the entire string. By adding the `BeatBox` wrapper, we can properly format the data (for example, splitting the string) before sending it to the `LinkedList`.

With this implementation, calling `BeatBox#append` with `"deep bop dop"` will result in three nodes being appended to the list.

## Expected Behavior

```ruby 
pry(main)> require "./lib/beat_box"
#=> true

pry(main)> require "./lib/linked_list"
#=> true

pry(main)> require "./lib/node"
#=> true

pry(main)> bb = BeatBox.new
#=> #<BeatBox:0x000000010f500108 @list=#<LinkedList:0x000000010f4e3ee0 @head=nil>>

pry(main)> bb.list
#=> #<LinkedList:0x000000010f4e3ee0 @head=nil>

pry(main)> bb.list.head
#=> nil 

pry(main)> bb.append("deep doo ditt")

pry(main)> bb.list.head.data
#=> "deep"

pry(main)> bb.list.head.next_node.data
#=> "doo"

pry(main)> bb.append("woo hoo shu")

pry(main)> bb.count
#=> 6
```
# Playing Beats

Now that we have our `BeatBox` class put together using the internal linked list to keep track of our beats, we can use it to actually play the beats.

At the command line, we can play sounds using the `say` command:

```
$ say -r 500 -v Boing "ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom "
```
It turns out we can also easily issue this command (or any other system command) from Ruby by using backticks: `` ` ``.

For example:

```
$ pry
> `say -r 500 -v Boing "ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom "`
```

Additionally, we can use standard string interpolation (#{}) to pass dynamic content into a system command:

```
$ pry
> beats = "ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom "
> `say -r 500 -v Boing #{beats}`
```

For this final section, add a play method to your BeatBox class that will generate the string content of the Beat and use it as input to the say command.

```
pry(main)> require "./lib/beat_box"
#=> true

pry(main)> require "./lib/linked_list"
#=> true

pry(main)> require "./lib/node"
#=> true

pry(main)> bb = BeatBox.new
#=> #<BeatBox:0x000000010f500108 @list=#<LinkedList:0x000000010f4e3ee0 @head=nil>>

pry(main)> bb.append("deep doo ditt woo hoo shu")

pry(main)> bb.count
#=> 6

pry(main)> bb.list.count
#=> 6

pry(main)> bb.play
#=> # plays the sounds deep doo ditt woo hoo shu
```
Note: You do not need to test the play method, but are welcome to give it a shot

##Iteration 4 - Extensions
###1. Validating Beats

There are a lot of words which aren’t going to work for beats. Like Mississippi.

Add validation to your program such that the input beats must be members of your defined list. Insertion of a beat not in the list is rejected. Like this:

```ruby
pry(main)> bb = BeatBox.new("deep")
#=> #<BeatBox:0x000000010f500108 @list=#<LinkedList:0x000000010f4e3ee0 @head=#<Node:0x000000010d179d88 @data="deep", @next_node=nil>>>

pry(main)> bb.append("Mississippi")

pry(main)> bb.all
#=> "deep"

pry(main)> bb.prepend("tee tee tee Mississippi")

pry(main)> bb.all
#=> "tee tee tee deep"
```
Here’s a starter list of valid beats, but add more if you like:

```ruby 
tee dee deep bop boop la na
```

2. Speed & Voice

Let’s make it so the user can control the voice and speed of playback. You may not have all the voices referenced here available on your machine. You can check which voices you have by following the steps documented here.

Originally we showed you to use `say -r 500 -v Boing` where `r` is the rate and `v` is the voice. Let’s setup a usage like this:

```ruby 
pry(main)> bb = BeatBox.new("deep dop dop deep")
#=> #<BeatBox:0x000000010f500108 @list=#<LinkedList:0x000000010f4e3ee0 @head=#<Node:0x000000010d179d88 @data="deep", @next_node=#<Node:0x000000010d179d38 @data="dop", @next_node=#<Node:0x000000010d179c70 @data="dop", @next_node=#<Node:0x000000010d179d38 @data="deep", @next_node=nil>>>>>>

pry(main)> bb.play
#=> # plays the four sounds normal speed with Boing voice

pry(main)> bb.rate = 100
#=> 100

pry(main)> bb.play
#=> # plays the four sounds slower with Boing voice

pry(main)> bb.voice = "Daniel"
#=> "Daniel"

pry(main)> bb.play
#=> # plays the four sounds slower with Daniel voice

pry(main)> bb.reset_rate
#=> 500

pry(main)> bb.reset_voice
#=> "Boing"

pry(main)> bb.play
#=> # plays the four sounds normal speed with Boing voice
```
Note: You do not need to test the play method, but are welcome to give it a shot
