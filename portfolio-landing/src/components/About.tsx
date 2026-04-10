'use client';

import { motion } from 'framer-motion';

export function About() {
  const specialties = [
    'Identidade Visual',
    'Embalagem Premium',
    'Sinalizações Comerciais',
    'Materiais Impressos Customizados',
  ];

  return (
    <section id="sobre" className="py-16 md:py-24 px-4 sm:px-6 lg:px-8 bg-gray-50">
      <div className="max-w-7xl mx-auto">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
          {/* Image/Placeholder */}
          <motion.div
            initial={{ opacity: 0, x: -20 }}
            whileInView={{ opacity: 1, x: 0 }}
            transition={{ duration: 0.6 }}
            viewport={{ once: true }}
            className="relative h-80 md:h-96 bg-gradient-to-br from-accent-200 to-primary-200 rounded-lg flex items-center justify-center"
          >
            <div className="text-center text-primary-600">
              <div className="text-6xl mb-2">🎨</div>
              <p className="text-sm text-primary-500">Fotografia em breve</p>
            </div>
          </motion.div>

          {/* Text Content */}
          <motion.div
            initial={{ opacity: 0, x: 20 }}
            whileInView={{ opacity: 1, x: 0 }}
            transition={{ duration: 0.6 }}
            viewport={{ once: true }}
          >
            <h2 className="text-3xl md:text-4xl font-bold text-primary-600 mb-6">
              Especialista em Design Gráfico desde 2015
            </h2>

            <p className="text-lg text-gray-700 mb-6 leading-relaxed">
              Com mais de uma década de experiência, transformo ideias em designs incríveis que comunicam, vendem e inspiram.
            </p>

            <div className="mb-8">
              <h3 className="text-xl font-semibold text-primary-700 mb-4">
                Minhas especialidades:
              </h3>
              <ul className="space-y-3">
                {specialties.map((specialty, index) => (
                  <li key={index} className="flex items-start">
                    <span className="text-accent-500 font-bold mr-3 text-lg">•</span>
                    <span className="text-gray-700 text-lg">{specialty}</span>
                  </li>
                ))}
              </ul>
            </div>

            <p className="text-gray-700 leading-relaxed">
              Trabalhando com empresas em Belo Horizonte e região para transformar ideias em designs incríveis que realmente funcionam.
            </p>
          </motion.div>
        </div>
      </div>
    </section>
  );
}
