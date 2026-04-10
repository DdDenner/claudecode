'use client';

export function Footer() {
  const currentYear = new Date().getFullYear();

  const socialLinks = [
    {
      name: 'Facebook',
      icon: '📘',
      url: 'https://facebook.com',
    },
    {
      name: 'Instagram',
      icon: '📷',
      url: 'https://instagram.com',
    },
    {
      name: 'YouTube',
      icon: '📺',
      url: 'https://youtube.com',
    },
  ];

  return (
    <footer className="bg-primary-600 text-white py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-7xl mx-auto">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8 mb-8">
          {/* Copyright */}
          <div className="text-center md:text-left">
            <p className="text-gray-300 text-sm">
              © {currentYear} Denner Design. Todos os direitos reservados.
            </p>
          </div>

          {/* Contact Info */}
          <div className="text-center">
            <p className="font-semibold mb-2">Contato</p>
            <a
              href="mailto:hello@denner.design"
              className="text-gray-200 hover:text-white transition-colors text-sm block"
            >
              hello@denner.design
            </a>
            <a
              href="tel:+556198765432"
              className="text-gray-200 hover:text-white transition-colors text-sm block"
            >
              (61) 98765-4321
            </a>
            <p className="text-gray-300 text-sm mt-1">
              Belo Horizonte, MG
            </p>
          </div>

          {/* Social Links */}
          <div className="text-center md:text-right">
            <p className="font-semibold mb-3">Redes Sociais</p>
            <div className="flex justify-center md:justify-end gap-4">
              {socialLinks.map((social) => (
                <a
                  key={social.name}
                  href={social.url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="text-2xl hover:text-accent-300 transition-colors"
                  aria-label={social.name}
                  title={social.name}
                >
                  {social.icon}
                </a>
              ))}
            </div>
          </div>
        </div>

        {/* Divider */}
        <div className="border-t border-primary-500 pt-8">
          <p className="text-center text-gray-300 text-xs">
            Desenvolvido com ❤️ usando Next.js e Tailwind CSS
          </p>
        </div>
      </div>
    </footer>
  );
}
