# Cloud computing with OpenStack
### An introduction
<!-- Note -->
This presentation consists of two parts:
- First, it deals with the question: What is Cloud Computing? Which
  challenges is it supposed to address?
- The second part gives a rough overview over the OpenStack cloud
  solution -- how does it work?


<!-- .slide: data-background="https://farm3.staticflickr.com/2502/3714874171_b3586284df_o_d.jpg" data-background-size="cover" -->
# So what is Cloud?

[Flickr/Daniel Spiess, CC-BY-SA](https://flic.kr/p/6EgGEF) <!-- .element: class="caption" -->

<!-- Note -->
Everybody's talking about Cloud Computing.  But there's no
general definition of it!  There is no general definition of "the
Cloud", and the term's used in an inflationary manner.


# IaaS
# SaaS
# PaaS

<!-- Note -->
Maybe you've also heard of these acronyms: Infrastructure as a
Service, Software as a Service, Platform as a service. When using
these terms, everybody's somehow thinking of the cloud, but nobody
knows what the cloud really has to do with all of this.


<!-- .slide: 
data-background="https://farm1.staticflickr.com/142/388474284_494e936024_o_d.jpg"
data-background-size="cover" -->

[Flickr/Mark Norman Francis, CC-BY-NC](https://flic.kr/p/Ak2Su) <!-- .element: class="caption" -->

## *"So you want Cloud Computing ..."* <!-- .element: class="fragment" -->

<!-- Note -->
and that tends to leave some of us slightly confused, at times.
      The interesting question to answer first thus is: What challenge
      is Cloud Computing supposed to address? And after all, what is
      it?  To solve this problem, first take a look at the typical
      relation between an infrastructure service provider, the
      customer and the technical environment.


<!-- .slide: data-background="https://farm3.staticflickr.com/2775/4381851322_998492c432_o_d.jpg" data-background-size="cover" -->
[Flickr/Leonardo Rizzi, CC-BY-SA](https://flic.kr/p/7Fd8JJ)  <!-- .element: class="caption" -->

<!-- Note -->
First of all, there's the infrastructure provider.

He wants:

- to satisfy his customers with his service -- because they'll remain customers only that way
- to optimize his own infrastructure so that running his platform causes him as little extra work as possible
- to run his infrastructure as cheap as possible because that saves him money.


<!-- .slide: 
data-background="https://farm3.staticflickr.com/2775/4381851322_998492c432_o_d.jpg"
data-background-size="cover" -->

# Automation
<!-- Note -->
Long story short: The infrastructure provider wants automation!


<!-- .slide: data-background="images/office-1209640_1920.jpg" data-background-size="cover" -->

[Pixabay/Unsplash, CC-0](https://pixabay.com/en/office-two-people-business-team-1209640/)  <!-- .element: class="caption" -->

<!-- Note -->
Then, here we have our customers (typically, these are Hosting
customers).

They want:
- a perfect service to be offered without any outages
- to be as flexible as possible (without long-running contracts)
- to pay as little as possible.


<!-- .slide: data-background="images/office-1209640_1920.jpg" data-background-size="cover" -->
# Automation
<!-- Note -->
That's possible with Automation, too!


<!-- .slide: data-background="https://farm4.staticflickr.com/3115/2826995939_12540f90a6_o_d.jpg" data-background-size="cover" -->

[Flickr/penguincakes, CC-BY-NC](https://flic.kr/p/5iP6pi)  <!-- .element: class="caption" -->

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


# ?

<!-- Note -->
The interesting question is: How can we modify the technical
environment to make the service provider and his customers a perfect
match?


<!-- .slide: data-background="images/servers-storage.svg" data-background-size="contain" -->
<!-- Note -->
The first step on the road was virtualization. Typical virtualization setups look like this:
- There's centralized storage, in this case, it's a typical SAN
- We also have a bunch of virtualization nodes, accessing that storage
- These might be cluster controlled for HA purposes
- They start virtual machines via a hypervisor


# Automation?


<!-- .slide: data-background="https://farm5.staticflickr.com/4050/4392789087_03f43e8199_o_d.jpg" data-background-size="cover" -->

[Flickr/Bailey Weaver, CC-BY](https://flic.kr/p/7Gbc9T)  <!-- .element: class="caption" -->

# ~~Automation~~
<!-- Note -->
Not much automation going on here:
- *Manually* provision storage
- *Manually* provision network resources
- *Manually* install an OS
- *Manually* add it to the management infrastructure

No self-service capability at all.

So let's go back to the customers and see what they would really
need.


<!-- .slide: data-background="images/button.png" data-background-size="contain" -->
<!-- Note -->
a GUI. An easy and intuitive one, too! Whatever they want to do,
they need an interface that allows them to do it without being a
rocket-science thing.

In addition to a GUI, we also want CLIs and client libraries so using
the cloud from a script or application is as easy as manipulating it
from a graphical interface.


<!-- .slide: data-background="images/fingerprint.png" data-background-size="contain" -->
<!-- Note -->
Authentication, authorization, and access control. The service
provider also has to provide a framework for access
restrictions. Different people in a company are allowed to do
different things, and the setup has to resemble this.


<!-- .slide: data-background="images/soda-machine.png" data-background-size="contain" -->
<!-- Note -->
The service provider also has to provide prepared images
containing an operating system, preferably as simple as getting soda
from a soda machine.


<!-- .slide: data-background="images/switch.png" data-background-size="contain" -->
<!-- Note -->
A solution must exist to integrate new VMs automatically into
the eventually existing network infrastructure. This includes VLAN
integration, this also included assigning freshly created VMs a new IP
address automatically.


<!-- .slide: data-background="images/brain.svg" data-background-size="contain" -->
<!-- Note -->
And last but not least, we need a central controlling instance
to keep all the things I mentioned earlier together.
