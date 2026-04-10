'use client';

import { motion } from 'framer-motion';

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

export function Portfolio() {
  const container = {
    hidden: { opacity: 0 },
    show: {
      opacity: 1,
      transition: {
        staggerChildren: 0.1,
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
        <div className="text-center mb-16">
          <h2 className="text-3xl md:text-5xl font-bold text-primary-600 mb-4">
            Meus Trabalhos Recentes
          </h2>
          <p className="text-lg text-gray-500">
            Projetos de design que transformaram ideias em realidade
          </p>
        </div>

        <motion.div
          variants={container}
          initial="hidden"
          whileInView="show"
          viewport={{ once: true }}
          className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 md:gap-6"
        >
          {PORTFOLIO_ITEMS.map((project) => (
            <motion.a
              key={project.id}
              href={project.link}
              target="_blank"
              rel="noopener noreferrer"
              variants={item}
              className="group relative overflow-hidden rounded-lg bg-gray-200 aspect-square hover:shadow-xl transition-all duration-300"
              whileHover={{ scale: 1.05 }}
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
            </motion.a>
          ))}
        </motion.div>
      </div>
    </section>
  );
}
