class PhotosController < ApplicationController
  def index

    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })
      
   render({ :template =>"photo_templates/index.html.erb" })
  end

  def show

    url_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_id })

    @the_photo = matching_photos.at(0) 

    render({ :template => "photo_templates/show.html.erb" })
   end
   def baii

    the_id = params.fetch("toast_id")
    
    matching_photos = Photo.where({ :id=> the_id })

    the_photo = matching_photos.at(0)

    the_photo.destroy

    #render ({ :template => "photo_templates/baii.html.erb"})

     redirect_to("/photos")
  end

  def create
    # Parameters: {"query_image"=>"https://www.chicagobooth.edu/-/media/project/chicago-booth/why-booth/a-global-footprint/a-dynamic-influence-in-europose-the-middle-east-and-africa/chicago-booth-london-building-entrance.jpg?cx=0.58&cy=0.72&cw=940&ch=749&hash=BA83D00D9BE1FDAA565CB2B6B949C1D0", "query_caption"=>"chicago Booth", "query_owner_id"=>"117"}


    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

     a_new_photo = Photo.new

     a_new_photo.image = input_image
     a_new_photo.caption = input_caption
     a_new_photo.owner_id = input_owner_id

     a_new_photo.save

    #render({ :template => "photo_templates/create.html.erb" })

    next_url = "/photos/" + a_new_photo.id.to_s

    redirect_to(next_url)
    end

    def update
      #Parameters: {"query_image"=>"https://www.chicagobooth.edu/-/media/project/chicago-booth/why-booth/a-global-footprint/a-dynamic-influence-in-europose-the-middle-east-and-africa/chicago-booth-london-building-entrance.jpg?cx=0.58&cy=0.72&cw=940&ch=749&hash=BA83D00D9BE1FDAA565CB2B6B949C1D0", "query_caption"=>"Booth Upated", "modify_id"=>"955"}

      the_id = params.fetch("modify_id")

      matching_photos = Photo.where({ :id => the_id })

      the_photo = matching_photos.at(0)

      input_image = params.fetch("query_image")
      input_caption = params.fetch("query_caption")

      the_photo.image = input_image 
      the_photo.caption = input_caption

      the_photo.save
      
      #render({ :template => "photo_templates/update.html.erb" })

      next_url = "/photos/" + the_photo.id.to_s

      redirect_to(next_url)

    end 

    def book 

      the_photo_id = params.fetch("input_photo_id")
      the_author_id = params.fetch("input_author_id")
      c_body = params.fetch("input_body")

      a_new_comment = Comment.new

      a_new_comment.photo_id = the_photo_id
      a_new_comment.author_id = the_author_id
      a_new_comment.body = c_body

      a_new_comment.save

      

 
      next_url = "/photos/" + the_photo_id.to_s

      redirect_to(next_url)


      end 

    end
