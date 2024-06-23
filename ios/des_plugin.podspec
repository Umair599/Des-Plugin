#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'des_plugin'
  s.version          = '0.0.6'
  s.summary          = 'Des and 3des encryption and decryption'
  s.description      = <<-DESC
                       Des and 3des encryption and decryption
                       DESC
  s.homepage         = 'https://github.com/umair599/flutter_des_plugin'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Umair Khalid' => 'umair.khalid.599@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.ios.deployment_target = '9.0'
end

