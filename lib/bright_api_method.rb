
class BrightApiMethod < Markup::Section
  instance_of_class_accessor String, :http_model
  instance_of_class_accessor Hash, :parameters
  instance_of_class_accessor Hash, :http_codes
  # if set to true, no SCORMCloud API key access
  instance_of_class_accessor Object, :realm_only_api

  def initialize(h={})
    self.parameters = {}
    self.http_codes = {}
    super
    children.push Markup::Section.new(
      title: 'HTTP Model',
      text: "
<table>
  <tr>
    <th>Verb</th>
	<th>Form</th>
  </tr>	
  <tr>
    <td>GET</td>
    <td>(http|https)://BRIGHT_URL/bright/api/v2/#{http_model}</td>
  </tr>
</table>
"
        )

    ps = Markup::Section.new(title: 'parameters')

    ps.text = "<table>
  <tr>
    <th>Parameter</th>
    <th>Example</th>
    <th>Notes</th>
  </tr>
   <tr>
     <td>__access method__</td>
	 <td>One of:
<table>
  <tr>
    <td>api_key=xxxxxxxxxx [an api key created previously]</td>
  </tr>
"
    if ! realm_only_api
      ps.text += "
  <tr>
    <td>sc_app_id=XXXXXXXXX&sc_secret_key=YYYYYYYYYYY [a valid SCORMCloud app ID/secret key pair]</td>
  </tr>
"
    end
    ps.text += "
  <tr>
    <td>realm_guid=XXXXXXXXX&realm_secret_key=YYYYYYYYYY [a valid Bright Realm GUID/secret key pair]</td>
  </tr>
</table></td>  
	 <td>see [Access Modes](#access-modes)</td>
  </tr>
"
    parameters.keys.each do |k|
      example_text = parameters[k].example ? "#{k}=#{parameters[k].example}" : ''
      ps.text += "
  <tr>
    <td><pre>#{k}</pre></td>
	<td>#{example_text}</td>
	<td>#{parameters[k].notes}</td>
  </tr>	
"
    end
    ps.text += "</table>"
    
    children.push ps

    hcs = Markup::Section.new(title: 'HTTP Codes')

    if http_codes.keys.length > 0
      hcs.text = "<table>
  <tr>	
    <th>Code</th>
	<th>Description</th>
  </tr>
"
      http_codes.keys.each do |k|
        hcs.text += "
  <tr>
    <td>#{k}</td>
	<td>#{http_codes[k]}</td>
  </tr>		 
"
      end
      hcs.text += "
</table>
"
    end
    children.push hcs
    [
      Markup::Section.new(title: 'Example'),
      Markup::Section.new(title: 'Return Data')].each do |s|
      children.push s
    end
  end
end

