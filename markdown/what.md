# Cloud computing with OpenStack
### An introduction
<!-- Note -->
I heard you wanted to know what cloud computing is? And what open
source has got to do with it?

Alright, let’s take a walk, shall we?


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
*computer time-slices* — to customers. And very frequently, that's a
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

And that’s pretty important because it facilitates the **scalability**
and **elasticity** of services.


# Scalability

<!-- Note --> 
Now what does scalability mean?

Take a real-world example of where scalability is extremely useful:
imagine any of those silly casting shows on TV, where once a week
there’s a vote by telephone and SMS, and then you have a service that
processes all those call-in and text votes. You’re going to not need
that capacity at all for 167 of the 168 hours in a week, but for that
one hour you’ll want it to ramp up like mad. You want that to be easy,
so that’s where you need an API.

But, to be clear, that’s a comparatively easy scenario because it’s
predictable, time-wise.


# Elasticity

<!-- Note -->
But suppose you’re running a niche online game that’s not really
popular — *until* some gameplay goes viral on Twitch or TikTok or
whatever, and suddenly and unpredictably your demand skyrockets. Your
servers breaking down at that moment would be the death knell for your
business, so you’ll absolutely want to meet that increased demand. The
only way that you can do that is to have a watchdog service that
monitors your traffic and then automatically scales as needed. And
once your traffic subsides, you also want to scale back down just as
quickly.

That’s what elasticity is, and here’s where having an API is
absolutely vital, because there’s absolutely no practical way that
humans sitting on admin consoles could pull this off.


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

So let's see what we would expect out of such a service.


# GUI
<!-- Note -->
I might want a GUI. An easy and intuitive one, too! Whatever I
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
