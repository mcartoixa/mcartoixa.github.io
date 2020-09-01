---
layout: post
title: "Software that works"
date: 2007-11-30 18:22:00 +0200
image: https://commons.wikimedia.org/wiki/File:Crude-oil_pipe_stills,_rundown_tanks,_and_%22Cat_Crackers%22_at_the_Baton_Rouge_Esso_Refinery,_ca._1945_-_NARA_-_535733.jpg
categories: software-craftsmanship
tags: opinion development oracle
---

I hate software that works. Deeply. From the bottom of my heart and soul. Let me try to explain why.

<a title="National Archives at College Park
 / Public domain" href="https://commons.wikimedia.org/wiki/File:Crude-oil_pipe_stills,_rundown_tanks,_and_%22Cat_Crackers%22_at_the_Baton_Rouge_Esso_Refinery,_ca._1945_-_NARA_-_535733.jpg"><img align="right" style="margin-left:10px" width="256" alt="Crude-oil pipe stills, rundown tanks, and &quot;Cat Crackers&quot; at the Baton Rouge Esso Refinery, ca. 1945 - NARA - 535733" src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Crude-oil_pipe_stills%2C_rundown_tanks%2C_and_%22Cat_Crackers%22_at_the_Baton_Rouge_Esso_Refinery%2C_ca._1945_-_NARA_-_535733.jpg/256px-Crude-oil_pipe_stills%2C_rundown_tanks%2C_and_%22Cat_Crackers%22_at_the_Baton_Rouge_Esso_Refinery%2C_ca._1945_-_NARA_-_535733.jpg"></a>
I have worked a lot with databases, and I have long been amazed at the ability [Oracle](http://www.oracle.com/) has had to consistently ship software that works. Sure, they have [their share of bugs](http://www.argeniss.com/woodb.html), but who hasn't? When you use their software, you can expect it to work. And nothing more. You can never expect consistency, nor OS integration, nor anything that could ease the pain of actually making it work. On the field of consistency for instance, I, for one, think that the procedures [`GETLENGTH`](http://download.oracle.com/docs/cd/B19306_01/appdev.102/b14258/d_lob.htm#i998484) and [`GET_STORAGE_LIMIT`](http://download.oracle.com/docs/cd/B19306_01/appdev.102/b14258/d_lob.htm#sthref3586) (in the [`DBMS_LOB`](http://download.oracle.com/docs/cd/B19306_01/appdev.102/b14258/d_lob.htm) package) are inconsistently named. But it works. [RTFM](http://en.wikipedia.org/wiki/RTFM). Have you ever tried to change the name of a computer with Oracle installed ([Express Edition](http://www.oracle.com/technology/products/database/xe/index.html) on Windows XP for instance)? Well, good luck if you want to see your database again.

In the world of software that works, there is no such incongruity as [refactoring](http://www.refactoring.com/). Think of it as the activity of changing code that works into code that does the same thing, but in a different way. In other words, it is one of the most stupid things to do, the mother of all evils. One software I have had the opportunity to work on had at one time been ported from DOS (16 bit) to Windows NT (32 bit) (the source code was in C). Compiling it the first time resulted in hundreds of warnings (`int`s would not fit in `short`s). My coworkers confirmed it was normal behavior, and that nothing could be done while the software worked. And certainly not refactoring. As a result, the compiler [ceased to be my friend](http://www.artima.com/cppsource/codestandards.html).

After a few years in the field, I have learn to develop a strong allergy to "software that works".

First of all, I regard the expression itself as pure nonsense. Yes, of course, software should work. And boats should float too. How would you call [a boat that does not float](http://en.wikipedia.org/wiki/Vasa_%28ship%29)? Software that does not work is no software. Call it an attempt, a bunch of source code, junk, whatever. Software works.

But what does it do exactly? Simple as this: software should do what it is supposed to do. This may sound a lot like "software should work", except that this expression subtly introduces the concepts of [software requirements](http://en.wikipedia.org/wiki/Software_Requirements_Specification) and of [quality attributes](http://www.softwarearchitectures.com/go/Discipline/DesigningArchitecture/QualityAttributes/tabid/64/Default.aspx). What is your software supposed to do? How efficient, usable or available is it supposed to be? I realize now that almost none of the projects I have worked on in the past had a central repository (like a simple document) to gather answers to these simple questions. To be honest, nobody realized that these questions existed and could be asked. Unfortunately, and as far as I can tell, this is still the state of the art for the software industry.

When you have requirements and attributes, you know what you can do with your code. If your software is a prototype, then it may not be worth refactoring it. If you design APIs, you might want to be consistent while naming them. The [`ASCIIEncoding`](http://msdn2.microsoft.com/en-us/library/system.text.asciiencoding.aspx) class in the .NET framework does not follow the [capitalization conventions](http://msdn2.microsoft.com/en-us/library/ms229043.aspx) set by Microsoft itself. The difference with Oracle here is that there is a rule, and that exceptions are few (and can be seen as mistakes). Try to guess in which environment developers get more productive, more quickly?

When you don't have requirements or attributes, your only sensible goal is to build software that works. Which means you don't really have a goal.

I love software development. It is a world where I can express a lot of creativity in trying to imagine solutions that fit into a set of requirements. Sometimes, I can even come dangerously close to the quixotic dreams of perfection I made as a teenager. I guess I have to be thankful that "software that works" regularly kicks in to bring me back to reality.