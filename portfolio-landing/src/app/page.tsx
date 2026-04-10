import { Header } from '@/components/Header';
import { Hero } from '@/components/Hero';
import { PortfolioFilter } from '@/components/PortfolioFilter';
import { About } from '@/components/About';
import { Contact } from '@/components/Contact';
import { Footer } from '@/components/Footer';

export default function Home() {
  return (
    <main className="w-full">
      <Header />
      <Hero />
      <PortfolioFilter />
      <About />
      <Contact />
      <Footer />
    </main>
  );
}
