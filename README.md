# Bitly-Bot

Bitly Bot is a utility tool that fetches the Topics that are Trending or are acknowledging sudden bursts of Traffic on Internet in Real Time, using Bitly' Social Data APIs. It outputs the Latest Hot and Bursting Stories along with the Most Popular Story Link associated with a Topic on the command line while giving Growl Notifications on Mac after every 20mins(set by default).

## Setup Procedure:

To proceed with the setup you need to have a fair knowledge about Ruby and RubyGems. In my local, I use [RVM](https://rvm.io/) to control multiple Ruby versions setup.

###Bitly-Bot

Clone the repository or download the tar or zip file on your local:

```bash
$ git clone https://github.com/ApoorvSaxena/Bitly-Realtime-Topics.git
```

### Environment and Dependencies

You need to install Bundler Gem to install gem dependencies.

```bash
$ gem install bundler
```

Now you need to run Bundler to install required gems on your local.

```bash
$ bundle install
```

### Bitly Application

To access Bitly's Social Data APIs from Bitly-Bot, you need to [Create](https://bitly.com/a/create_oauth_app) a Bitly application and [Generate](https://bitly.com/a/oauth_apps) a Bitly Generic Access Token.

After you have generated the Generic Access Token you need to replace the default access token in Config.yml file, present in the Application folder

```
access_token: j34h5kj34h534j5m4h4j53dnd455jh656mnsn4jh4j45
```

### Growl Notifications

Bitly-Bot allows you to get notifications when it fetches the latest Trending Topics and associated links from Bitly's Social Data APIs. Currently it provides notifications on Mac OS X using [Growl](http://growl.info) Application.

If you are running Mac OS X, then you can download and install Growl on your Machine, we haven't provided a solution for getting Notifications on Windows or Linux, though you can search for one and contribute in our code. 

## Running Bitly-Bot

### Command Line

Now that we have completed our installtion process, we simply need to run our Bitly-Bot as a daemon, which will output Trending and Bursting Topics in our Terminal after every X interval of time and will give Notification Popups on our screen.

```bash
$ bundle exec ruby bitly-bot.rb start
```
Though you would not want Bitly-Bot from running, but considering the case, when you don't want to get Real Time updates from the outside world while working on your machine, then you can run the following command from the Application Directory  in any Terminal Window to stop Bitly-Bot

```bash
$ ruby bitly-bot.rb stop
```

![Example Usage Output](https://dl.dropboxusercontent.com/u/46483432/bitly-bot.png)

### Customizing Bitly-Bot

You might want to delay the notifications from Bitly after every 20mins to the time that suits your comfort. To customize the delay you need to edit the delay parameter in config.yml from 20 to any value(measured in minutes).

```
delay: 20
```