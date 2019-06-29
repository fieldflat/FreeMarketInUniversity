module MicropostsHelper
    def transaction_now?(micropost_id)
        Room.find_by(micropost_id: micropost_id).present?
    end
end
