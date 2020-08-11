class UserPurchase
    include ActiveModel::Model
    attr_accessor  :firstname, 
                   :lastname,  
                   :firstname_alias, 
                   :lastname_alias, 
                   :nickname, 
                   :birthday, 
                   :email, 
                   :postal_code, 
                   :prefecture, 
                   :city, 
                   :house_number, 
                   :building_name, 
                   :tel, 
                   :token
        
    

    def save(exhibition_id)
        user = User.create(firstname: firstname, lastname: lastname, firstname_alias: firstname_alias, lastname_alias: lastname_alias, nickname: nickname, birthday: birthday, email: email, )
        Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, user_id: user.id)
        Purchase.create(user_id: user.id, exhibition_id: exhibition_id)
    end
end