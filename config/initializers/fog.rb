CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws' 
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:   'AKIAIFVMRJD2TRPMKHKQ',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-2',             # optional, defaults to 'us-east-1'
    endpoint:        'https://s3.ap-northeast-2.amazonaws.com'
  }
  config.fog_directory  = 'nolnol'            # required
end
