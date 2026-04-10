'use client';

import Link from 'next/link';
import { motion } from 'framer-motion';

export function Hero() {
  return (
    <section
      className="relative min-h-screen md:min-h-[600px] bg-gradient-to-b from-primary-600 to-primary-600/70 flex items-center justify-center px-4 sm:px-6 lg:px-8"
    >
      <div className="max-w-4xl mx-auto text-center">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6 }}
        >
          <h1 className="text-4xl md:text-6xl font-bold text-white mb-6">
            Denner Design
          </h1>
          <p className="text-lg md:text-2xl text-gray-100 mb-8 leading-relaxed">
            Especialista em Design Gráfico para Sua Identidade Visual
          </p>
          <Link
            href="#portfolio"
            className="inline-block bg-accent-500 hover:bg-accent-600 text-white font-bold py-3 px-8 rounded-lg transition-colors duration-200 shadow-lg hover:shadow-xl"
          >
            Veja Meu Portfólio
          </Link>
        </motion.div>
      </div>
    </section>
  );
}
