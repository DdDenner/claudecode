import os
import anthropic

PERFIL = """
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
"""

PROMPT_SUGESTOES = """
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
"""

def sugerir_ideias(client):
    print("Buscando ideias para esta semana...\n")
    message = client.messages.create(
        model="claude-opus-4-6",
        max_tokens=600,
        system=PERFIL,
        messages=[{"role": "user", "content": PROMPT_SUGESTOES}]
    )
    return message.content[0].text


def gerar_conteudo(client, tema):
    prompt = f"""Crie conteúdo completo para redes sociais sobre este tema:

TEMA: {tema}

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
(descreva em 2 linhas que tipo de imagem ou arte combina com este post — para o Denner criar ou orientar)
"""

    print("Gerando conteúdo completo...\n")
    message = client.messages.create(
        model="claude-opus-4-6",
        max_tokens=2048,
        system=PERFIL,
        messages=[{"role": "user", "content": prompt}]
    )
    return message.content[0].text


def salvar_resultado(tema, conteudo):
    pasta = os.path.join(os.path.dirname(__file__), "posts-gerados")
    os.makedirs(pasta, exist_ok=True)
    nome = tema.lower()[:40].strip().replace(" ", "_").replace("/", "-") + ".txt"
    caminho = os.path.join(pasta, nome)
    with open(caminho, "w", encoding="utf-8") as f:
        f.write(f"TEMA: {tema}\n")
        f.write("=" * 50 + "\n\n")
        f.write(conteudo)
    return caminho


def main():
    client = anthropic.Anthropic()

    print("=" * 50)
    print("  AGENTE 1 — GERADOR DE POSTS")
    print("  Denner · Designer de Redes Sociais · BH")
    print("=" * 50)
    print()

    ideias = sugerir_ideias(client)
    print(ideias)
    print()
    print("─" * 50)
    print("Digite o número da ideia (1-6), ou escreva seu próprio tema:")
    print("─" * 50)
    escolha = input("> ").strip()

    # Se for número, extrai o título da ideia correspondente
    if escolha.isdigit() and 1 <= int(escolha) <= 6:
        linhas = [l for l in ideias.strip().split("\n") if l.strip()]
        idx = int(escolha) - 1
        if idx < len(linhas):
            linha = linhas[idx]
            # Remove o número inicial e pega o conteúdo
            tema = linha.split(".", 1)[-1].strip()
        else:
            tema = escolha
    else:
        tema = escolha

    print(f"\nTema escolhido: {tema}\n")

    conteudo = gerar_conteudo(client, tema)

    print("=" * 50)
    print(conteudo)
    print("=" * 50)

    salvar = input("\nSalvar em arquivo .txt? (s/n): ").strip().lower()
    if salvar == "s":
        caminho = salvar_resultado(tema, conteudo)
        print(f"Salvo em: {caminho}")

    print("\nAgente finalizado.")


if __name__ == "__main__":
    if not os.environ.get("ANTHROPIC_API_KEY"):
        print("AVISO: ANTHROPIC_API_KEY não encontrada.")
        print("Configure com: set ANTHROPIC_API_KEY=sua-chave-aqui\n")
    main()
