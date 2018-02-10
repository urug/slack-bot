# Urug Bot

The Utah Ruby User's Group Slack Bot

## Quick Start
This bot assumes you have [RVM](https://rvm.io/) installed. If you don't, head to their site for installation instructions

Once you've installed rvm and installed the correct Ruby, run the following

```
git clone git@github.com:urug/slack-bot.git
cd slack-bot
bundle install
cp .env.sample .env
# Get the URUG token from Slack and add it to your .env file
foreman start
```
## Contributing
Check out our guide at [CONTRIBUTING.md](./CONTRIBUTING.md)

## Deployment
Check out our guide at [DEPLOYMENT.md](./DEPLOYMENT.md)

## Resources
Checkout the [slack-ruby-bot](https://github.com/slack-ruby/slack-ruby-bot) library for more information. They include a handy [tutorial](https://github.com/slack-ruby/slack-ruby-bot/blob/master/TUTORIAL.md) as well.

Additionally, you can checkout this [example](https://github.com/jasonwc/reddit-bot-example) from a URUG [talk](https://github.com/jasonwc/i-for-one-welcome-our-new-robot-overlords) given by Jason Carter that served as the boilerplate for this bot.
