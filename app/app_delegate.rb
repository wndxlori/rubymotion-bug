class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'debug'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    url = NSURL.URLWithString('https://swapi.co')
    client = AFHTTPSessionManager.alloc.initWithBaseURL(url)
    client.GET('/api/films',
        parameters:nil,
        success: lambda { |request, response|
          puts "In success"
        }, failure: lambda {|request, error| # correct number of parameters is important
          puts "In failure"
        })

    true
  end
end
