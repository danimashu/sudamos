module TransloaditHelper
  def custom_transloadit(template, options = {})
    assembly = Transloadit::Rails::Engine.template(template, options)
    params = MultiJson.dump(assembly.options.merge(
      auth: assembly.transloadit.to_hash,
      steps: assembly.steps
    ).delete_if { |_k, v| v.nil? })

    fields = hidden_field_tag(:params, params, id: nil)

    if Transloadit::Rails::Engine.configuration["auth"]["secret"].present?
      signature = Transloadit::Rails::Engine.sign(params)
      fields << hidden_field_tag(:signature, signature, id: nil)
    end

    fields
  end
end
