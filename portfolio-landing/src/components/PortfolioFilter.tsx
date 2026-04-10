'use client';

import { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';

const PORTFOLIO_ITEMS = [
  { id: 1, title: 'Alpha Noivas', category: 'Identidade Visual', link: 'https://drive.google.com/open?id=15oxGUeGb24ppYWml9xA-kbIEB44Ccx_3' },
  { id: 2, title: 'Bio Actif', category: 'Identidade Visual', link: 'https://drive.google.com/open?id=1aIh3Gx1h0TNSo4UeR6452T47IODBJdAG' },
  { id: 3, title: 'Malt Imobiliária', category: 'Identidade Visual', link: 'https://drive.google.com/open?id=1hHUsPC-EI-2jeedm94vNNNHOyUBgM1l7' },
  { id: 4, title: 'Cozinha da Drica', category: 'Identidade Visual', link: 'https://drive.google.com/open?id=1aNpyRCp7mDwX-lpwxNxKUDO0MYgV58Tp' },
  { id: 5, title: 'Salão da Lela', category: 'Identidade Visual', link: 'https://drive.google.com/open?id=19qyzTn_BDPQPdVroEOm_oibNtGQNPmiU' },
  { id: 6, title: 'See through Cabelereia', category: 'Identidade Visual', link: 'https://drive.google.com/open?id=1wOyy6e6g1Ank86ikDaIkpWPXNv1L7AlB' },
  { id: 7, title: 'Seetru Espeto na Brasa', category: 'Identidade Visual', link: 'https://drive.google.com/open?id=1zZISDEqcQEp-ZEecFj1x8JZ2-AHY-UHI' },
  { id: 8, title: 'Pavio Mágico Jr', category: 'Identidade Visual', link: 'https://drive.google.com/open?id=1bzK_vmSLuXBzowZ4gkg5olMOtclmtTjI' },
  { id: 9, title: 'Rádio Radar', category: 'Identidade Visual', link: 'https://drive.google.com/open?id=1nwaOnCWGgqv7oqxrlLmUqxIElL6WWxbS' },
  { id: 10, title: 'Chefya Íntima', category: 'Moda Íntima', link: 'https://drive.google.com/open?id=1pT_jo62r3RClADL14zEKg1dYpkKPIvwG' },
  { id: 11, title: 'Helen Multi Acessórios', category: 'Sinalização', link: 'https://drive.google.com/open?id=15MdqA85JRcvwxW8iHNyMaD-EEKFPVOEC' },
  { id: 12, title: 'Salgados Riquette', category: 'Sinalização', link: 'https://drive.google.com/open?id=1bmRJKk2H6HAS-I4gSURhbvUoQf0SP-4b' },
  { id: 13, title: 'Bar e Mercearia Gomes', category: 'Sinalização', link: 'https://drive.google.com/open?id=1oEEiQkz1Y9QBuMy_1opuKH8p9JEXWonY' },
  { id: 14, title: 'Flyer Terapia', category: 'Marketing', link: 'https://drive.google.com/open?id=1USFCJ0QB8JrFkNR5fCTlkTreKPojwEHW' },
];

const CATEGORIES = ['Todos', 'Identidade Visual', 'Sinalização', 'Moda Íntima', 'Marketing'];

export function PortfolioFilter() {
  const [activeCategory, setActiveCategory] = useState('Todos');
  const [selectedProject, setSelectedProject] = useState<typeof PORTFOLIO_ITEMS[0] | null>(null);

  const filteredItems = activeCategory === 'Todos'
    ? PORTFOLIO_ITEMS
    : PORTFOLIO_ITEMS.filter(item => item.category === activeCategory);

  const container = {
    hidden: { opacity: 0 },
    show: {
      opacity: 1,
      transition: {
        staggerChildren: 0.05,
      },
    },
  };

  const item = {
    hidden: { opacity: 0, y: 20 },
    show: { opacity: 1, y: 0 },
  };

  return (
    <section id="portfolio" className="py-16 md:py-24 px-4 sm:px-6 lg:px-8 bg-white">
      <div className="max-w-7xl mx-auto">
        {/* Header */}
        <div className="text-center mb-12">
          <h2 className="text-3xl md:text-5xl font-bold text-primary-600 mb-4">
            Meus Trabalhos Recentes
          </h2>
          <p className="text-lg text-gray-500">
            Projetos de design que transformaram ideias em realidade
          </p>
        </div>

        {/* Filter Buttons */}
        <div className="flex flex-wrap justify-center gap-3 mb-12">
          {CATEGORIES.map((category) => (
            <motion.button
              key={category}
              onClick={() => setActiveCategory(category)}
              whileHover={{ scale: 1.05 }}
              whileTap={{ scale: 0.95 }}
              className={`px-4 py-2 md:px-6 md:py-3 rounded-full font-semibold transition-all duration-300 ${
                activeCategory === category
                  ? 'bg-accent-500 text-white shadow-lg'
                  : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
              }`}
            >
              {category}
            </motion.button>
          ))}
        </div>

        {/* Gallery Grid */}
        <motion.div
          variants={container}
          initial="hidden"
          animate="show"
          className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 md:gap-6"
        >
          <AnimatePresence mode="wait">
            {filteredItems.map((project) => (
              <motion.button
                key={project.id}
                variants={item}
                onClick={() => setSelectedProject(project)}
                className="group relative overflow-hidden rounded-lg bg-gray-200 aspect-square hover:shadow-xl transition-all duration-300 text-left cursor-pointer"
                whileHover={{ scale: 1.05 }}
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: -20 }}
                transition={{ duration: 0.3 }}
              >
                {/* Placeholder background */}
                <div className="w-full h-full bg-gradient-to-br from-primary-200 to-accent-200 flex items-center justify-center p-4">
                  <div className="text-center">
                    <div className="text-sm md:text-base font-semibold text-primary-700 line-clamp-3 mb-2">
                      {project.title}
                    </div>
                    <span className="inline-block bg-accent-500 text-white text-xs font-bold px-2 py-1 rounded">
                      {project.category}
                    </span>
                  </div>
                </div>

                {/* Overlay on hover */}
                <div className="absolute inset-0 bg-accent-500/10 opacity-0 group-hover:opacity-100 transition-opacity duration-300" />
              </motion.button>
            ))}
          </AnimatePresence>
        </motion.div>

        {/* Empty State */}
        {filteredItems.length === 0 && (
          <div className="text-center py-12">
            <p className="text-gray-500 text-lg">
              Nenhum projeto encontrado nesta categoria.
            </p>
          </div>
        )}
      </div>

      {/* Modal */}
      <AnimatePresence>
        {selectedProject && (
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            onClick={() => setSelectedProject(null)}
            className="fixed inset-0 z-50 bg-black/50 flex items-center justify-center p-4"
          >
            <motion.div
              initial={{ scale: 0.9, opacity: 0 }}
              animate={{ scale: 1, opacity: 1 }}
              exit={{ scale: 0.9, opacity: 0 }}
              onClick={(e) => e.stopPropagation()}
              className="bg-white rounded-lg max-w-2xl w-full p-6 md:p-8"
            >
              <div className="flex justify-between items-start mb-4">
                <div>
                  <h3 className="text-2xl md:text-3xl font-bold text-primary-600 mb-2">
                    {selectedProject.title}
                  </h3>
                  <p className="text-gray-600">
                    <span className="inline-block bg-accent-100 text-accent-700 px-3 py-1 rounded font-semibold">
                      {selectedProject.category}
                    </span>
                  </p>
                </div>
                <button
                  onClick={() => setSelectedProject(null)}
                  className="text-gray-500 hover:text-gray-700 text-2xl"
                  aria-label="Close modal"
                >
                  ✕
                </button>
              </div>

              {/* Modal Content */}
              <div className="mb-6">
                <div className="w-full h-64 md:h-96 bg-gradient-to-br from-primary-100 to-accent-100 rounded-lg flex items-center justify-center mb-4">
                  <div className="text-center">
                    <div className="text-6xl mb-2">🎨</div>
                    <p className="text-primary-600 font-semibold">Imagem em breve</p>
                  </div>
                </div>
                <p className="text-gray-700 leading-relaxed mb-4">
                  Este é um projeto de design gráfico profissional. Clique no botão abaixo para ver mais detalhes no Google Drive.
                </p>
              </div>

              {/* Modal Actions */}
              <div className="flex gap-4">
                <a
                  href={selectedProject.link}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex-1 bg-accent-500 hover:bg-accent-600 text-white font-bold py-3 px-6 rounded-lg transition-colors duration-200 text-center"
                >
                  Ver Projeto Completo
                </a>
                <button
                  onClick={() => setSelectedProject(null)}
                  className="flex-1 bg-gray-100 hover:bg-gray-200 text-gray-700 font-bold py-3 px-6 rounded-lg transition-colors duration-200"
                >
                  Fechar
                </button>
              </div>
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>
    </section>
  );
}
