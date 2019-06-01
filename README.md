# Setting Up
This app is built against ruby 2.6.3, please ensure you have the correct version of ruby.

Run the following commands to set up the app:

```bash
bundle install
bundle exec rails db:create
bundle exec rails db:migrate
```

After this you can start the server using

```bash
bundle exec rails server
```

### Fake Twitter Integration

Please include the `client_id` and `client_secret` provided in a `.env` file placed in the root directory of the app.

The contents of the file should look like below:

```
FAKE_TWITTER_CLIENT_ID=xxx
FAKE_TWITTER_CLIENT_SECRET=xx
```


