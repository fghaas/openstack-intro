# Cloud computing with OpenStack
### An introduction
<!-- Note -->
This presentation consists of two parts:
- First, it deals with the question: What is Cloud Computing? Which
  challenges is it supposed to address?
- The second part gives a rough overview over the OpenStack cloud
  solution -- how does it work?


# So what is Cloud?

<!-- Note -->
So, cloud computing means that instead of running systems on your own
computers, you run them on someone else's computers. Simple enough,
eh? It's pretty much like the difference between owning a railroad, and
buying a train ticket.

Getting from point A to point B by high-speed rail is an excellent
means of travel, but a high-speed rail link (and its rolling stock)
requires ridiculous expense to develop, set up, maintain, and operate. It’s
simply not practical to own a railroad system, or even a train, even a
train *car* for private use. Instead, what you do is you buy a
time-slice of the railroad (that’s your train ticket) for your
journey. When you’ve arrived, you get off, when you need to go back,
you get back on.

So that's what a cloud computing company does. Runs a large number of
servers, shoulders all the initial expense and the upkeep and
maintenance, and then just sells virtual machines — effectively
*computing time-slices* to customers. And very frequently, that's a
much, much cheaper way for the individual customer to run
systems. It's a very basic principle of economics called [economies of
scale](https://en.wikipedia.org/wiki/Economies_of_scale): as the
output grows, your cost per unit of output gets lower. Making ten
thousand bicycles in a highly efficient factory makes it cheaper on
average than to make one bicyle from raw materials in your garage. If
your unit of output is an hour of CPU time, that will be cheaper if
you run ten thousand servers in a data center, rather than ten.


# IaaS

Infrastructure as a Service

<!-- Note -->
Okay, now what’s IaaS or infrastructure as a service? It’s the idea
that you have access to a whole slew of low-level building blocks
(“infrastructure)” which, rather than being physically available in a
datacenter, are available as virtual resources: servers, block
devices, network interfaces, network switches, routers, firewalls —
all of those have a virtual equivalent.

And the “as a service” part has a very clearly defined meaning which
is that all of these resources are not only available through a *user*
interface (like an admin console or some such), but also though a
*machine* interface (an **application programming interface** or API)
so that you can use programs to manipulate your infrastructure.


# Elasticity

<!-- Note --> 
And that’s pretty important because it facilitates **elasticity** of
services.

Take a real-world example of where that might come in handy: imagine
any of those silly casting shows on TV, where once a week there’s a
vote by telephone and SMS, and then you have a service that processes
all those call-in and text votes. You’re going to not need that
capacity at all for 167 of the 168 hours in a week, but for that one
hour you’ll want it to ramp up like mad. And to be clear that’s an
easy scenario because it’s predictable, time-wise.

But suppose you’re running a niche online game that’s not really
popular — *until* some gameplay goes viral on Twitch or TikTok or
whatever, and suddenly and unpredictably your demand skyrockets. Your
servers breaking down at that moment would be the death knell for your
business, so you’ll absolutely want to meet that increased demand. The
only way that you can do that is to have a watchdog service that
monitors your traffic and then automatically scales as needed.


# REST

Representational State Transfer

<!-- Note -->
And there’s one other thing in the “as a service” bit, which is
something of a de-facto standard: if something is “as a service”, it
doesn’t just have any API, it has a REST API. This means that it uses
HTTP as its standard protocol, and everything that you do in
infrastructure has an equivalent HTTP API call.

And since HTTP is a pretty rich protocol with a lot of methods, that
gives us the ability to, for example, send an HTTP `GET` request to
retrieve information about a resource, send HTTP `PATCH` to modify it,
and HTTP `DELETE` to remove it.

And of course we get a lot of benefits from not having to reinvent the
wheel on a lot of things: we know very well how to encrypt HTTP
(through HTTPS), proxy it, use authentication, cache it, etc. etc.

All of which means that we can make *the service itself* very
scaleable, as well.


## “So you want Cloud Computing ...”

<!-- Note -->
So what are our general expectations of cloud computing? To discuss
that, let’s first take a look at the typical relation between an
infrastructure service provider, the customer, and the technical
environment.


### Infrastructure providers

<!-- Note -->
First of all, there's the infrastructure provider. If we put ourselves
in their shoes, we want:

- to satisfy his customers with our service -- because they'll remain
  customers only that way;
- to optimize our infrastructure, so that running our platform
  causes us as little extra work as possible;
- to run our infrastructure as cheaply as possible because that saves
  us money.


# Automation

<!-- Note -->
Long story short: As an infrastructure provider, we want automation!


### Infrastructure customers

<!-- Note -->
Then, we have our customers.

They want:
- a perfect service to be offered without any outages
- to be as flexible as possible (without long-running contracts)
- to pay as little as possible.


# Automation
<!-- Note -->
That's possible with Automation, too!


### Conventional data center infrastructure

<!-- Note -->
Now let's take a look at the technical environment involved in
this. This typically connects service providers and customers. And
in the conventional data center, it suffers from some design problems:

For the infrastructure provider: 
- Lots of iron in his DC
- High cost for acquiring and maintaining hardware
- High power consumption
- Low utilization, little efficiency

For the customers: 
- Complicated, non-automatic setup process
- Long-running contracts
- This leads to high overall cost

The interesting question is: How can we modify the technical
environment to make the service provider and his customers a perfect
match?


### Virtualization

<!-- Note -->
The first step on the road was virtualization. Typical virtualization setups look like this:
- There's centralized storage, in this case, it's a typical SAN
- We also have a bunch of virtualization nodes, accessing that storage
- These might be cluster controlled for HA purposes
- They start virtual machines via a hypervisor


# Automation?
Meh. <!-- .element class="fragment" -->

<!-- Note -->
Not much automation going on here:
- *Manually* provision storage
- *Manually* provision network resources
- *Manually* install an OS
- *Manually* add it to the management infrastructure

No self-service capability at all.

So let's go back to the customers and see what they would really
need.


# GUI
<!-- Note -->
So, I might want a GUI. An easy and intuitive one, too! Whatever I
want to spin up or reconfigure in the cloud, I’ll need an interface
that allows me to do that without being rocket science.


# CLI/API
<!-- Note -->
In addition to a GUI, we also want CLIs and client libraries so using
the cloud from a script or application is as easy as manipulating it
from a graphical interface.


# AuthN/AuthZ
<!-- Note -->
Authentication and authorization, and also access control. The service
provider has to provide a framework for access restrictions. Different
people are allowed to do different things, and the setup has to
resemble this.


# Multi-tenancy
<!-- Note -->
Closely related is the concept of multi-tenancy, which is the ability
to *logically* segment and compartmentalize a *physical* infrastructure
that is inherently shared. If I run a virtual server on the same
physical hardware as you, I want my server to be as inaccessible to
you by default as if they were in a different country.


# Images
<!-- Note -->
The service provider also has to provide prepared images containing an
operating system, preferably as simple as getting some coffee out of
an automatic coffee machine. I don’t want to have to worry about the
intricate details of what parts need to move and what liquids need to
flow to produce my ristretto, I just want one to come out when I push
a button. Likewise I don’t want to have to deal with the basic
installation of, say, an Ubuntu server. I just want to send a request
to spin on up from a master image, and then log into it in a matter of
seconds.


# Networking
<!-- Note -->
A solution must exist to integrate new VMs automatically into the
eventually existing network infrastructure. This includes VLAN
integration, this also included assigning freshly created VMs a new IP
address automatically.


# Storage
<!-- Note -->
I also need the ability to manage persistent storage, both block
storage and object storage.


# Servers
<!-- Note -->
Of course, I want the ability to run virtual machines.


# Containers
<!-- Note -->
And if VMs are not my thing, I might want to orchestrate containers instead.
