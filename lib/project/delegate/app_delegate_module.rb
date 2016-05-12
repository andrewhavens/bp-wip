module BlackPotion
  module AppDelegateModule
    include BlackPotion::Support

    def application(application, didFinishLaunchingWithOptions: launch_options)
      on_load(application, launch_options)
      true
    end

    def application(application, didFailWithError: error)
      try :on_fail, error
    end

    def application(application, didStopWithOptions: options)
      try :on_stop, options
    end

  end
end
