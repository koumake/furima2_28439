const pay = () => {
    Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  
    const form = document.getElementById("charge-form");
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      console.log(form);
      const formResult = document.getElementById("charge-form");
      const formData = new FormData(formResult);
      
      // const card = {
      //   number: formData.get("number"),
      //   cvc: formData.get("cvc"),
      //   exp_month: formData.get("exp_month"),
      //   exp_year: `20${formData.get("exp_year")}`,
      // };
      
      const card = {
        number: $("#user_purchase_number").val(),
        cvc: $("#user_purchase_cvc").val(),
        exp_month: $("#user_purchase_exp_month").val(),
        exp_year: `20${$("#user_purchase_exp_year").val()}`,  
        
      };
      
      //20-22gy
  
      Payjp.createToken(card, (status, response) => {
        console.log(status);
        console.log(response);
        
        if (status === 200) {
          const token = response.id;
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} type="hidden" name='token'>`;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
  
          document.getElementById("user_purchase_number").removeAttribute("name");
          document.getElementById("user_purchase_cvc").removeAttribute("name");
          document.getElementById("user_purchase_exp_month").removeAttribute("name");
          document.getElementById("user_purchase_exp_year").removeAttribute("name");
  
          document.getElementById("charge-form").submit();
          document.getElementById("charge-form").reset();
        } else {
        }
      });
    });
  };
  
  window.addEventListener("load", pay);