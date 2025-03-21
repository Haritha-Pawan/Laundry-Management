

document.addEventListener('DOMContentLoaded', () => {


    const addButtons = document.querySelectorAll('.addbtn');
    const modal = document.getElementById('modal');
    const popupImage = document.getElementById('popup-image');
    
  
    const closebtn = document.getElementById('close');

    addButtons.forEach(button => {
        button.addEventListener('click', (event) => {
            const card = event.target.closest('.card');
            const image = card.querySelector('img').src; 
        
           

            popupImage.src = image;
          
           

            modal.style.visibility='visible';

            closebtn.addEventListener('click', () => {
                modal.style.visibility = 'hidden';
            })
        });
    });

  

    window.addEventListener('click', (event) => {
        if (event.target === modal) { 
            modal.style.visibility = 'none';
        }
    });
});












//add product section//

const add = document.getElementById('plus');
const drop = document.getElementById('drop');
const counter = document.getElementById('count');


let count = 0;

add.addEventListener('click', ()=>{
    count++;
    counter.textContent=count;
});

drop.addEventListener('click',()=>{
    if(count>0){
        count--;
        counter.textContent=count;
    }
})




