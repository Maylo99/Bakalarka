module ApplicationHelper
  def link_to_add_fields(name, form,association)
    ##vytvorenie noveho objektu asociacie
    new_object=form.object.send(association).klass.new
    id=new_object.object_id
    ##vytvorenie fields form
    fields=form.fields_for(association,new_object,child_index: id) do |builder|
      render(association.to_s.singularize+"_fields",builder: builder)
    end
    ##poslanie linku na fields form
    link_to(name,"#",class: 'add_fields',data:{id: id,fields: fields.gsub("\n","")})

  end
end
