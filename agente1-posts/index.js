import Anthropic from "@anthropic-ai/sdk";
import readline from "readline";
import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

const client = new Anthropic();

const PERFIL = `
Você é o assistente de marketing digital do Denner, designer gráfico de Belo Horizonte
que está expandindo seus serviços para criação de conteúdo visual para redes sociais.

PERFIL DO DENNER:
- Designer com 2 anos de experiência, dominando CorelDRAW
- Está entrando no mercado de posts, artes e identidade visual para Instagram e LinkedIn
- Público-alvo: donos de negócio e tomadores de decisão (B2B)
- Localização: Belo Horizonte
- Diferencial: olhar de designer profissional aplicado às redes sociais

IMPORTANTE:
- O conteúdo deve posicionar o Denner como especialista em design para redes sociais
- Tom profissional mas próximo, direto ao ponto
- Foco em resultados visuais e impacto no negócio do cliente
- Nunca mencionar materiais físicos (banners, lonas, fachadas)
`;

const PROMPT_SUGESTOES = `
Sugira 6 ideias de posts para o Denner publicar esta semana no Instagram e LinkedIn.

As ideias devem variar entre:
- Mostrar bastidores e processo criativo
- Educar o cliente sobre design para redes sociais
- Apresentar resultados e cases (mesmo que hipotéticos)
- Posicionamento pessoal e autoridade
- Dicas práticas que o público-alvo vai achar útil
- Conteúdo que gera engajamento ou pergunta

Formato da resposta — liste exatamente assim, sem introdução:
1. [TÍTULO CURTO] — [descrição em uma frase do que seria o post]
2. [TÍTULO CURTO] — [descrição em uma frase do que seria o post]
3. [TÍTULO CURTO] — [descrição em uma frase do que seria o post]
4. [TÍTULO CURTO] — [descrição em uma frase do que seria o post]
5. [TÍTULO CURTO] — [descrição em uma frase do que seria o post]
6. [TÍTULO CURTO] — [descrição em uma frase do que seria o post]
`;

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

function pergunta(texto) {
  return new Promise((resolve) => rl.question(texto, resolve));
}

async function sugerirIdeias() {
  console.log("Buscando ideias para esta semana...\n");

  const message = await client.messages.create({
    model: "claude-opus-4-6",
    max_tokens: 600,
    system: PERFIL,
    messages: [{ role: "user", content: PROMPT_SUGESTOES }],
  });

  return message.content[0].text;
}

async function gerarConteudo(tema) {
  const prompt = `Crie conteúdo completo para redes sociais sobre este tema:

TEMA: ${tema}

Gere exatamente nesta ordem e com estes títulos:

## INSTAGRAM
(legenda com até 2200 caracteres, use emojis com moderação, termine com CTA para orçamento pelo WhatsApp ou Direct)

## LINKEDIN
(legenda profissional sem excesso de emojis, fala diretamente com o dono do negócio sobre o valor do design)

## HASHTAGS
(5 hashtags principais + 10 de nicho, todas em uma linha só)

## STORIES
(roteiro de 3 slides curtos, máximo 2 linhas cada — direto ao ponto)

## DICA DE IMAGEM
(descreva em 2 linhas que tipo de imagem ou arte combina com este post — para o Denner criar ou orientar)`;

  console.log("\nGerando conteúdo completo...\n");

  const message = await client.messages.create({
    model: "claude-opus-4-6",
    max_tokens: 2048,
    system: PERFIL,
    messages: [{ role: "user", content: prompt }],
  });

  return message.content[0].text;
}

function salvarResultado(tema, conteudo) {
  const pasta = path.join(__dirname, "posts-gerados");
  if (!fs.existsSync(pasta)) fs.mkdirSync(pasta);

  const nome = tema.toLowerCase().slice(0, 40).trim().replace(/\s+/g, "_").replace(/\//g, "-") + ".txt";
  const caminho = path.join(pasta, nome);

  fs.writeFileSync(caminho, `TEMA: ${tema}\n${"=".repeat(50)}\n\n${conteudo}`, "utf-8");
  return caminho;
}

async function main() {
  if (!process.env.ANTHROPIC_API_KEY) {
    console.log("AVISO: ANTHROPIC_API_KEY não encontrada.");
    console.log("Configure com: set ANTHROPIC_API_KEY=sua-chave-aqui\n");
  }

  console.log("=".repeat(50));
  console.log("  AGENTE 1 — GERADOR DE POSTS");
  console.log("  Denner · Designer de Redes Sociais · BH");
  console.log("=".repeat(50));
  console.log();

  const ideias = await sugerirIdeias();
  console.log(ideias);
  console.log();
  console.log("─".repeat(50));
  console.log("Digite o número da ideia (1-6), ou escreva seu próprio tema:");
  console.log("─".repeat(50));

  const escolha = (await pergunta("> ")).trim();

  let tema;
  const num = parseInt(escolha);
  if (!isNaN(num) && num >= 1 && num <= 6) {
    const linhas = ideias.split("\n").filter((l) => l.trim());
    const linha = linhas[num - 1] || escolha;
    tema = linha.replace(/^\d+\.\s*/, "").trim();
  } else {
    tema = escolha;
  }

  console.log(`\nTema escolhido: ${tema}`);

  const conteudo = await gerarConteudo(tema);

  console.log("=".repeat(50));
  console.log(conteudo);
  console.log("=".repeat(50));

  const salvar = (await pergunta("\nSalvar em arquivo .txt? (s/n): ")).trim().toLowerCase();
  if (salvar === "s") {
    const caminho = salvarResultado(tema, conteudo);
    console.log(`Salvo em: ${caminho}`);
  }

  console.log("\nAgente finalizado.");
  rl.close();
}

main().catch((err) => {
  console.error("Erro:", err.message);
  rl.close();
  process.exit(1);
});
