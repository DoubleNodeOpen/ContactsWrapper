Pod::Spec.new do |s|

  s.name         = "ContactsWrapper"
  s.version      = "0.9"
  s.summary      = "Contacts wrapper for iOS 9 or upper with Objective-C"
  s.homepage     = "https://github.com/abdullahselek/ContactsWrapper"
  
  s.license      = { 
        :type => "MIT", 
        :file => "LICENSE" 
  }

  s.author              = {
      'Abdullah Selek' => 'abdullahselek@yahoo.com'
  }
  s.source              = {
        :git => 'https://github.com/abdullahselek/ContactsWrapper.git',
        :tag => s.version.to_s
    }
  s.ios.deployment_target = '9.0'
  s.source_files        = 'ContactsWrapper/Source/*.{h,m}'
  s.requires_arc        = true
  s.framework  = "Contacts"

end
