# React, Statistics And DataMining
Hi,<br>
Here are the code(written in R) and thoughts of some statistics and data mining of the React game data.<br>
<br>
<br>
<img width="200" src="http://corner-egypt.codio.io/c/i/Brand.png" alt="React logo" title="React logo">
<br>
<br>
<h2>But first, what is react?</h2>
<p><b>React, the game (https://goo.gl/BvL9S2)</b>, is a <b>independent mobile game made with ♥ as a side project</b> on the free time between college and 9-5 job. It's a game about "quick reactions" where you need to match the shape on the center with your corresponding shape on one of the sides. Check it out on the <a href="https://play.google.com/store/apps/details?id=com.agelabs.react">google play</a> if you've never heard about it, the reading of this analysis will be much more clean after this.</p><br>
<p>On the beginning, React was imagined to adapt your "difficulty" to your users, in other words, as long as a user get better on React it will become harder and as long as a user struggle to reach some milestone React become easier. Pretty cool, no? </p>
<p><b>But we have a problem</b>, as long as we don't have any data about how users will behave inside React's mechanics we cannot predict how React engine should behave to adapt itself, and the solution for this was <b>release React and then collect the data to make it intelligent</b>. Because of this React was released as an "Alpha/Beta" version some time ago and now, with some data in hands, and after <b>lots of fixed bugs</b> and <b>interface redesigns</b> we can go through this process and make the awesomeness of react's mind happen! 🚀 </p>

<h2>How this intelligence will work? 🐙</h2>
<p>React's mind will adapt the game so the user can reach some specific milestone with some specific effort. For example, let's say that a fun React play is when you can reach the 3rd dimension before things start to get insane, so React need to comprehend when it needs to change your own environment so people can reach the 3rd dimension with a relative medium effort. To summarize this concept, let's say that for every 100 plays only 15 of these plays can reach the 3rd dimension, so React needs to get a bit easier to be fun to play, and in the other hand if for every 100 plays 70 of these pass through the 3rd dimension means that react user is getting experienced and it's time to get a bit harder to be fun.</p>

<h2>And what data do we need to feed this mind? And how to collect these? 🐟</h2>
<p>We can construct such intelligence with just some simple data from how users play React, like how much games have they played, average score, average time playing, etc. but as long as this study progress you will see how much information such simple data can carry. Everytime a React user finish a play we collect some data from their run, like the score, time playing on that run and some other things, after that, the data is sent to our <a href="https://nodejs.org/">NodeJS</a> server API and stored on a <a href="https://www.mongodb.org/">MongoDB</a> database so we can analyze them later and React players can have a "Global Highscore" feature to know how they perform versus another players.</p>

<h2>Okay we have the data, but now what?</h2>
<p>To create a powerfull engine for React's brain just a bunch of data isn't enough, we need to extract the gold from this soil, and for this "extraction" our pickaxe were metamorphosed in <a href="http://www.r-project.org/">R</a>, a well rooted programming language in the field of statistical computing and graphics.</p>
<p>Since R is out for a long time now we have a lot of usefull libraries on the web to use, a lot of content on stackoverflow to answer our questions and a lot of free courses avaiable over the internet, so it wasn't a pain at all to learn and apply R on this project.</p>
<p><b>With the right tools in hands and fresh data from our users we can start the mining.</b></p>
