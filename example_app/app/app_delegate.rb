class AppDelegate < BP::AppDelegate
  def on_load(app, options)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @tv_base_url = "http://localhost:9001/"
    @tv_app_url  = "js/application.js"

    appControllerContext = TVApplicationControllerContext.alloc.init
    appControllerContext.launchOptions = {"BASEURL" => @tv_base_url}
    appControllerContext.javaScriptApplicationURL = NSURL.URLWithString("#{@tv_base_url}#{@tv_app_url}")

    @appController = TVApplicationController.alloc.initWithContext(appControllerContext, window: @window, delegate: self)
  end

  def on_fail(error)
    puts "didFailWithError: #{error}"

    title = "Error Launching Application"
    message = error.localizedDescription
    alert = UIAlertController.alertControllerWithTitle(title, message: msg, preferredStyle: UIAlertControllerStyleAlert)

    @appController.navigationController.presentViewController(alertController, animated: true, completion: -> {
      # ...
    })
  end

  def on_stop(options)
    puts "didStopWithOption: #{options}"
  end

end
