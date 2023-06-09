---
title: "In praise of opinionated frameworks"
description: "Flexibility is overrated, sometimes it is better to use opinionated tools, frameworks, and languages"

tags: 
  - technology
  - language
  - framework
  - angular
  - react
  - kubernetes
  - fargate
  - swarm
  - docker

---

It might appear that the tech industry tends to gravitate towards tools, languages and frameworks that are highly flexible by design.  Said technologies will capture attention through numerous blog posts, articles and social media bluster about them, perpetuating their [hype cycles](https://www.gartner.co.uk/en/methodologies/gartner-hype-cycle).  The problem with this perception is that it prematurely captures mindshare which in turn can lead to poor decision making among the [unseen 99%](https://www.hanselman.com/blog/dark-matter-developers-the-unseen-99) of developers.  

Those decisions are often based on popularity and not merit, and such decisions come with consequences.  Instead of teams learning _how_ to pick technologies based on requirements, they are pressured into _what_ to pick despite requirements.  The biggest selling point from an organisational perspective is the flexibility of those technologies, and the potential that they offer, even if they never end up using that potential.  

The pressure is felt especially in organisations where a team is an island using or considering using  _x_ in an ocean of _y_, and where the terms 'efficiencies' and 'scale' get thrown around to enforce consistency, scaring the teams to conform or perish as pariahs.  The consequences of these forced decision are not felt by the ones doing the enforcement, but by the teams using it, over a protracted period of unquantifiable paper cuts.  One of the major downsides of very flexible frameworks is the mental overhead that it introduces and the way those overheads manifests itself throughout its various touchpoints.  

I don't consider flexible things to be a great first choice when making certain kinds of tech decisions. Instead, the simplest way to get started on a new technology is to use _opinionated_ things.  These are tools, languages, and frameworks that accomplish the same thing as their flexible counterparts, but in a prescribed, specific, dogmatic way.  They are relatively easier and faster to get started with, and simpler to work with as there is no real debate about how things should be done, just get things done.  Over time as the stack and the teams grow, they can learn what their requirements and needs are, and finally gain greater confidence in the decision making behind future things, including very flexible things, or continuing with opinionated things.     


## Container orchestration

The biggest name in orchestration at present is Kubernetes (k8s) which has certainly [captured the mindshare](https://searchsoftwarequality.techtarget.com/news/252474373/Kubernetes-tools-vendors-vie-for-developer-mindshare) in this space.  It is a powerful, pluggable framework which many organisations certainly benefit from, and this flexibility has spawned its own mini-industry of software and tooling, because it abstracts the OS layer away and proceeds to recreate existing OS concepts within its own realm.  

K8s is so popular, that it gets [_confused_ with running containers](https://aws.plainenglish.io/containers-are-not-just-for-kubernetes-fa330653cbbd).  It is also a very 'komplik8d' beast, in terms of the number of moving parts and the security attack surface.  Sadly it is not uncommon for teams to run k8s clusters without understanding what it's doing behind the scenes or even being aware of many consequences of their decisions on the cluster's security.  That's not usually a concern until it does become a concern (that's a problem for future me!).  Getting started with a k8s cluster setup is not a light task either, as a lot of implementation decisions need to be made up front, and if there is no coordination and agreement between teams, the end result is a set of clusters that look and behave differently; the benefits of scaling and efficiencies are therefore lost.  For these reasons, it's not a great idea to run a k8s cluster without having dedicated organisational support in place to manage it.  K8s becomes a double-edged sword, that same organisational structure increases the barrier towards standing up what ought to be very simple tasks, since suborgnisational complexity and processes only ever increase over time.  

The simpler, opinionated alternatives to k8s are Docker Swarm, Nomad and ECS Fargate.  Swarm is one of the simplest and easiest ways to get started with Docker deployments, for zero to medium scaling needs (beaten in simplicity by standalone docker containers).  It is very easy to  create and join swarms with a single command, and swarms can also run docker-compose files, which gives it almost no overhead translating local development workflows to deployment workflows.  For teams that are moving from normal VMs and EC2s into the world of containers, Docker Swarm is an excellent starting choice with minimal lock-in and overhead. 

AWS ECS Fargate containers are a step just beyond that, it's the equivalent of 'serverless' docker.  It can also [work with docker compose files](https://docs.docker.com/cloud/ecs-integration/), but is most commonly deployed to using ECS Task Definitions, specifying resources, secrets, environment variables, and ECS takes care of the rest — running the container, health checks and ensuring a minimum baseline.  The overhead is minimal, though slightly more than Docker Swarm, and is still a very good choice for teams that want to run containers without the overhead of managing servers. 


## SPA frameworks

Single Page Application frameworks (SPAs) are a common way to build modern web applications.  The most popular SPAs currently are React, Angular and Vue, with React taking a greater portion of the developer mindshare.  React is highly flexible built with abstractions in mind, with many different components and implementations available for different parts of its stack.  The language's complexity has been increasing over time, have a look at the [page about Hooks](https://reactjs.org/docs/hooks-intro.html) which struggles to explain or introduce the concept properly.  React is an ecosystem unto itself, with a steep learning curve. Getting started with a React project is not a fast process either — the team must decide and often debate over what kinds of components they will use. Each piece of the stack represents its own moving part, and each one is a non-transitive dependency that has its own repositories, maintenance cycles, and vulnerabilities.  The end result is that different React codebases even within the same team can look and behave differently, and have to be developed differently too. 

Angular and Vue are the relatively simpler, opinionated alternatives.  'Relatively' because there is no such thing as truly simple SPA frameworks, modern development is irreversibly bloated; for the purposes of this topic though Angular and Vue are simpler from a development perspective.  In Angular, pretty much everything needed for the application is defined and ready to be generated, including the structure, adding required files, naming conventions, and routing. There is usually just one way to accomplish a task, the 'Angular way', and this results in a consistent set of codebases across teams.  


## Languages

Java is commonly used for enterprise and banking applications.  It is not actually an example of an unopinionated language, but gets treated like one for another reason.  In certain areas of Java, the lack of certain language features, or complexity of certain other language features over the past decades has made it a very common practice to use third party libraries to simplify development.  Common areas where third party libraries get used are date-time functions, collection functions, dependency injection, MVC, API, unit testing, OAuth.  Again, this comes with the overhead of teams deciding what to use for which topic, but at the same time Java's third party community ecosystem has matured very well over time and is probably one of the best all around.  

C# (.NET) and Python tend to strike a balance in these areas, and they do it quite well.  C# is quite opinionated, and it helps that .NET already comes with unit testing, MVC, API, dependency injection, as well as a consistent, well designed, easy to use language syntax and language APIs.  It is not very common for .NET teams to use very many third party libraries, nor is it common to look towards third party libraries by default.  .NET provides most of what's needed, and sometimes it doesn't, for which there are third party libraries. 

Python is well known for being opinionated, that's one of its defining features and its selling points. It is one of the easiest languages to get started with and to work with due to its simple design.  It's highly readable, almost pseudo-code like, and there are simple guidelines to follow. There is often just one way to do a thing in Python and it is common to use the word [Pythonic](https://docs.python-guide.org/writing/style/) to describe these.  Little wonder that it gets used for simple projects aimed at learning programming, as well as huge projects for datascientists who are more concerned with the data, rather than the language features itself.  


## Counter examples

These viewpoints on opinionated things versus flexible things probably won't stand up to a lot of scrutiny; it's pretty easy to come up with counter examples. Ruby is a language that is opinionated, but  seems to have gone _too far_ with its opinions.  It dives deeply into the concept of convention-over-configuration, and in doing so, creates a lot of behind the scenes magic that requires a lot of pre-knowledge before using or understanding it well; the true knowledge of its syntax and its behaviors feels more tribalistic to a set of esoteric elders who have taken the time to read the documentation, but is not necessarily friendly to casual beginners.  One could say it has gone off the rails. 

Not precisely a counter example, but a case of deliberate decision making: operating systems.  Commercial desktop and mobile operating systems (win/mac/ios/android) are opinionated, and designed to pull users in and lock them in to their ecosystems. These systems are harmful from a privacy perspective as they deny users choice and control of their data and workflows.  The best accessible alternatives are Linux based operating systems (distros).  Linux distros are not opinionated, quite the opposite, with each distro expressing itself slightly differently.  Similarly for mobile OSes there are Graphene and CalyxOS, very secure and private, but not opinionated at all.  For operating systems, that flexibility is not a bad thing, since they are a tool meant for direct user interaction. People whose requirements include  privacy and control of their data, as well as developers and advanced users, would take the time to set up a Linux distro. 


