document.addEventListener(
  "DOMContentLoaded", e => {
    if (document.getElementById("submit-token") != null) { 
      Payjp.setPublicKey("pk_test_7a48f26460ea9759e5956520"); 
      let btn = document.getElementById("submit-token"); 
      btn.addEventListener("click", e => { 
        e.preventDefault(); 
        let card = {
          number: document.getElementById("card_number_new").value,
          cvc: document.getElementById("cvc_new").value,
          exp_month: document.getElementById("exp_month_new").value,
          exp_year: document.getElementById("exp_year_new").value
        }; 
        Payjp.createToken(card, (status, response) => {
          if (status === 200) { 
            $("#card_number_new").removeAttr("name");
            $("#cvc_new").removeAttr("name");
            $("#exp_month_new").removeAttr("name");
            $("#exp_year_new").removeAttr("name"); 
            $("#card_token_new").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            );
            document.inputForm.submit();
            alert("登録が完了しました"); 
          } else {
            alert("カード情報が正しくありません。"); 
          }
        });
      });
    }
  },
  false
); 