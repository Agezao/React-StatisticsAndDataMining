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
<br>
<h2>How this intelligence will work? 🐙</h2>
<p>React's mind will adapt the game so the user can reach some specific milestone with some specific effort. For example, let's say that a fun React play is when you can reach the 3rd dimension before things start to get insane, so React need to comprehend when it needs to change your own environment so people can reach the 3rd dimension with a relative medium effort. To summarize this concept, let's say that for every 100 plays only 15 of these plays can reach the 3rd dimension, so React needs to get a bit easier to be fun to play, and in the other hand if for every 100 plays 70 of these pass through the 3rd dimension means that react user is getting experienced and it's time to get a bit harder to be fun.</p>
<br>
<h2>What data do we need to feed this mind? And how to collect these? 🐟</h2>
<p>We can construct such intelligence with just some simple data from how users play React, like how much games have they played, average score, average time playing, etc. but as long as this study progress you will see how much information such simple data can carry. Everytime a React user finish a play we collect some data from their run, like the score, time playing on that run and some other things, after that, the data is sent to our <a href="https://nodejs.org/">NodeJS</a> server API and stored on a <a href="https://www.mongodb.org/">MongoDB</a> database so we can analyze them later and React players can have a "Global Highscore" feature to know how they perform versus another players.</p>
<br>
<h2>Okay we have the data, but now what? 🐁</h2>
<p>To create a powerfull engine for React's brain just a bunch of data isn't enough, we need to extract the gold from this soil, and for this "extraction" our pickaxe were metamorphosed in <a href="http://www.r-project.org/">R</a>, a well rooted programming language in the field of statistical computing and graphics.</p>
<p>Since R is out for a long time now we have a lot of usefull libraries on the web to use, a lot of content on stackoverflow to answer our questions and a lot of free courses avaiable over the internet, so it wasn't a pain at all to learn and apply R on this project.</p>
<p><b>With the right tools in hands and fresh data from our users we can start the mining.</b></p>
<br>
<hr>
<small>*all the data, numbers and graphs used below are avaiable in this repository within the code to reproduce them;*</small><small>*the data provided as date or time will be presented as +00:00 UTC but will be discussed as -3 GMT since 80% of React players came from this time zone;*</small><small>*all the graphs presented here can be found in the ./Plots folder in this repository;*</small>
<br>
<h2>What react users have said to us?</h2>
<h4><b>First, we analyze how React users perform within the game in a general way:</b></h4>
<img width="600" src="https://raw.githubusercontent.com/Agezao/React-StatisticsAndDataMining/master/plots/1-%20Average%20score%20by%20game%20mode.jpg" alt="React graph 1" title= "React graph 1"/>
<p>So in a global average the React user scores 44rp, this isn't good at all, the 3rd dimension started just after the 30rp and the "insanity" level of React starts at >90rp, people are getting struggled just after the 3rd dimension appears, is React is too hard?</p>
<img width="500" src="https://raw.githubusercontent.com/Agezao/React-StatisticsAndDataMining/master/plots/2-%20Average%20perceived%20score%20performance%20between%20game%20modes.jpg" alt="React graph 2" title= "React graph 2"/>
<p>Another curious thing here is that games on Black mode scores an average of 46% more than the General average score. Curious. Is the brain more confortable to identify shapes and colors in a "darker" environment?</p>
<h4><b>How much time are users using on React?</b></h4>
<img width="600" src="https://raw.githubusercontent.com/Agezao/React-StatisticsAndDataMining/master/plots/3-%20Average%20time%20played%20per%20user.jpg" alt="React graph 3" title= "React graph 3"/>
<p>701 seconds, or 11.6 minutes, is the average time that some one have passed playing on React</p>
<img width="500" src="https://raw.githubusercontent.com/Agezao/React-StatisticsAndDataMining/master/plots/User%20-%20User%20vs%20Time%20Playing%20-%20General.jpg" alt="React graph 4" title= "React graph 4"/>
<p>*For curiosity, the user that have spended more time playing React have a milestone of 82 minutes, or 1.36 hous, that's a lot of time, thanks for the appreciation.</p>
<h4><b>How much games have users played?</b></h4>
<img width="500" src="https://raw.githubusercontent.com/Agezao/React-StatisticsAndDataMining/master/plots/8-%20Average%20number%20of%20plays%20per%20user.jpg" alt="React graph 5" title= "React graph 5"/>
<p>In average a React user plays 17 games.</p>
<br>
<p><b>So we know that an average React player have spended 11.6 minutes playing in 17 plays and got an average of 44rp</b></p>
<h4>So how can we set the constants to React adapt itself?</h4>
<p>Now that we know how a average React user behaves we can say to the engine how he should behave to users have fun games. Soon we will code in React's mind and after it's lock and load we'll publish it on GitHub too and so we can demonstrate how all this data helps the process. Stay tuned;</p>

<br/>
<br/>

> <small>*All this work was made with ❤️ by <a href="https://br.linkedin.com/in/gabrielrcosta">Gabriel "Age" Rodrigues</a> and <a href="https://www.facebook.com/GameREACT">React</a> team*</small>

<br/>
<br/>

<hr>

<small>*Following the study progress i will write down here the news oberved*</small>
<br>
<h4>Another infos collected from the data</h4>
<img width="500" src="https://raw.githubusercontent.com/Agezao/React-StatisticsAndDataMining/master/plots/4-%20Average%20score%20progress%20related%20to%20number%20of%20plays.jpg" alt="React graph 6" title="React graph 6"/>
<p>The average score of people that play more than 50 times is 275% greater than the average of those who plays less than 50 times. Wow.</p>
<br/>
<img width="500" src="https://raw.githubusercontent.com/Agezao/React-StatisticsAndDataMining/master/plots/5-%20Plays%20by%20time%20of%20day%2C%20as%20rate%20-%20UTC%2B0.jpg" alt="React graph 7" title="React graph 7"/>
<p>43% of all React plays was made in between 10 and 15 hours(-3GMT), with a special look at the 15hr that holds 13% of all React plays alone.</p>
<img width="500" src="https://raw.githubusercontent.com/Agezao/React-StatisticsAndDataMining/master/plots/6-%20Average%20score%20by%20time%20of%20day%20-%20UTC%2B0.jpg" alt="React graph 8" title="React graph 8"/>
<p>But in the other hand plays who happen between 15-18hr(-3GMT) have an average score of only 17rp, while the games in between 3-5hr have an average score of 75rp. We can say that Owls are the best React players.</p>
<img width="500" src="https://raw.githubusercontent.com/Agezao/React-StatisticsAndDataMining/master/plots/6-%20Progress%20rate%20between%20general%20average%20and%20time%20of%20day%20average%20-%20UTC%2B0.jpg" alt="React graph 9" title="React graph 9"/>
<p>So we can say that games that happens between 3-5hr(-3GMT) scores an average of 109% more than the general score average. Pretty weird.</p>
<br>
<img width="500" src="https://raw.githubusercontent.com/Agezao/React-StatisticsAndDataMining/master/plots/7-%20Plays%20by%20week%20day%2C%20as%20rate%20-%20UTC%2B0.jpg" alt="React graph 10" title="React graph 10"/>
<p>For some reason, React players are very Thursday addictive, 32% of all the games happens on this day. I don't know well why, and i don't really care about since it's a good number, what grinds me here is the number of games on the weekend. Why such a low rate? Should we make double points on weekends or something like this to attract weekend players? :-c</p>


