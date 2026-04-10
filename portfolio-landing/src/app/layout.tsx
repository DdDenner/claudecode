import type { Metadata } from 'next';
import '@/styles/globals.css';

export const metadata: Metadata = {
  title: 'Denner | Design Gráfico Profissional',
  description: 'Portfólio de design gráfico com identidades visuais, embalagens, sinalizações e muito mais. Especialista em design para empresas em Belo Horizonte.',
  keywords: ['design gráfico', 'identidade visual', 'logo design', 'belo horizonte'],
  authors: [{ name: 'Denner Gomes' }],
  openGraph: {
    title: 'Denner | Design Gráfico',
    description: 'Portfólio profissional de design gráfico',
    images: [
      {
        url: '/og-image.jpg',
        width: 1200,
        height: 630,
      },
    ],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Denner | Design Gráfico',
    description: 'Portfólio profissional de design gráfico',
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="pt-BR">
      <head>
        <meta charSet="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" href="/favicon.ico" />
        <meta name="theme-color" content="#6d28d9" />
      </head>
      <body className="bg-white text-gray-900">
        {children}
      </body>
    </html>
  );
}
