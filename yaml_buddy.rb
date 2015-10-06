# Module that can be included (mixin) to create and parse YML files
module YamlBuddy
  def take_yaml(yml)
    @data = YAML.load(yml)
  end

  def to_yaml
    @data.to_yaml
  end
end
