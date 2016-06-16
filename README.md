# Example application that saves page access infos

To run the app you need to install the gem bundle. So, run the gem bundle. Run

```shell
rake db:migrate
```

and run the app with

```shell
rails server
```

To see the registered users, just go to http://localhost:3000/users. There you can click in a particular user to see the visited pages.