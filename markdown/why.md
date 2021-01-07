## Why compete with AWS?

<!-- Note -->
You may ask: why does OpenStack compete with AWS, with Google, with
Azure? Surely *their* economies of scale are even better?

Yes, they are. And the only people who ever thought OpenStack would
take on and beat AWS in the general-purpose cloud playing field were
venture capitalists signing onto OpenStack early, hoping to make a 10x
exit (and the startup founders that took their money). That was never
in the cards, which is why they were the first to jump ship and
quickly declared OpenStack hopeless.

But that’s a bit like showing up in a hospital’s operating room for a
heart transplant, carrying an organ transport box with an artichoke
heart in it. It’s not going to work.


## Find a vertical, build a cloud for that

<!-- Note -->
But what’s absolutely a thing is to take this highly capable cloud
platform, and tailor it for a specific market or vertical. You won’t
beat AWS in general-purpose cloud, but you *can* be *way* better than
Amazon in cloud optimized for a specific market, and OpenStack clouds
use this left right and center. Specifically in heavily-regulated
industries where most of the compliance is in process and
documentation and QA, not in the software: finance comes to mind, as
does healthcare and telecommunications.


## Why open source?

<!-- Note -->
And why do all of this as open source? Because it’s the superior
software development model. It’s faster, it’s better, it produces
better code and documentation, it helps everyone, and it doesn’t lock
you into ridiculous liabilities and dependencies on a single vendor.


## But the others don’t either!

<!-- Note --> 
Amazon, Google, Microsoft don’t open-source their cloud
platform, but they all operate like open source communities! Literally
everything in software development that has significantly changed the
industry comes out of open source. Distributed collaborative software
development was made possible on a massive scale because of Git, which
came directly out of the development scaling needs of the Linux
kernel.

The concept of gated development — the fact that no change must ever
break code, regardless of whether it’s part of a release or not, that
you want full coverage from unit and integration tests and if a change
breaks any of those it doesn’t merge — comes directly out of Drizzle
and OpenStack. Every software project worth its salt uses those
concepts today.

The AWS, Google, Microsoft cloud engineering teams all use those tools
and processes now, it’s just that they are so large that their
developer organizations are larger than some open source
communities. So *they* for themselves can use proprietary development
models but it doesn’t mean anyone smaller should.
