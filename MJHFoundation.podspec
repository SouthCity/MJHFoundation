Pod::Spec.new do |s|

s.name        = 'MJHFoundation'
s.version     = '0.1.3'
s.authors     = { 'southCity' => 'mjhforwork@163.com' }
s.homepage    = 'https://github.com/SouthCity/MJHFoundation'
s.summary     = '个人项目使用类库'
s.source      = { :git => 'https://github.com/SouthCity/MJHFoundation.git',:tag => s.version }
s.license     = { :type => "MIT", :file => "LICENSE" }
s.platform = :ios, '9.0'
s.requires_arc = true
s.source_files = 'MJHFoundation'
s.public_header_files = 'MJHFoundation/*.h'
s.ios.deployment_target = '9.0'
s.dependency:'AFNetworking', '~> 3.2.1'
s.dependency:'SVProgressHUD', '~> 2.2.5'

end
