import './Hero.css';

const Hero = () => {
    return (
      <main className="hero">
        <div className="hero-content">
          <h1>YOUR FEET DESERVE THE BEST</h1>
          <p> {/* Changed <P> to <p> */}
            YOUR FEET DESERVE THE BEST, AND WE ARE HERE TO HELP YOU WITH THE
            QUALITY SHOES. HOPE THAT YOU WILL LIKE IT.
          </p>
  
          <div className="hero-btn">
            <button>Shop Now</button>
            <button>Category</button>
          </div>
        </div>
        <div className="hero-image">
            <img src="/shoe.jpg" alt="shoe" />
        </div>
      </main>
    );
  };
  
  export default Hero;
  