let orderCount = 0;
let customerCount = 0;
let garmentCount = 0;
let yearCount = 0;

const targetValues = {
    order: 1000,           
    customer: 1420,         
    garment: 150,         
    year: 5,            
};

const duration = 1000;  


function incrementCounts() {
   
    let startTime = Date.now();

   
    let interval = setInterval(function() {
        let elapsedTime = Date.now() - startTime;
        
        orderCount = Math.floor((elapsedTime / duration) * targetValues.order);
        customerCount = Math.floor((elapsedTime / duration) * targetValues.customer);
        garmentCount = Math.floor((elapsedTime / duration) * targetValues.garment);
        yearCount = Math.floor((elapsedTime / duration) * targetValues.year);

        document.getElementById('order-count').textContent = `+${orderCount}`;
        document.getElementById('customer-count').textContent = `+${customerCount}`;
        document.getElementById('garment-count').textContent = `+${garmentCount}`;
        document.getElementById('year-count').textContent = `+${yearCount}`;

        if (elapsedTime >= duration) {
            clearInterval(interval);
        }
    }, 10);  
}

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            incrementCounts();  
        }
    });
}, { threshold: 0.5 }); 


const aboutSection = document.getElementById('about-us');
observer.observe(aboutSection);  
