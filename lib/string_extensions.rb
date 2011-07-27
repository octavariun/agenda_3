class String

  def downcapi
    self.downcase.capitalize
  end
  
  def particiona(marcador)
    particionado = []
    if self.index(marcador).blank?
      particionado << self
      particionado << ''
      particionado << ''
    else
      particionado << self[0...self.index(marcador)]
      particionado << marcador
      particionado << self[self.index(marcador)+marcador.length..self.length]
    end
    particionado
  end
  
  HUMANIZES = { # colocar novas palavras em ordem alfabétic a
    "acao"=>"Ação",
    "agencia"=>"Agência",
    "alteracao"=>"Alteração",
    "amortizacao"=>"Amortização",
    "atuacao"=>"Atuação",
    "atualizacoes"=>"Atualizações",
    "cobranca_preventiva"=>"Cobrança Preventiva",
    "cobranca_pos_vencimento"=>"Cobrança Pós Vencimento",
    "codigo"=>"Código",
    "comentario"=>"Comentário",
    "contabil" => "Contábil",
    "credito" => "Crédito",
    "cpf_cnpj" => "CPF/CNPJ",
    "data_expiracao"=>"Data Expiração",
    "ddd"=>"DDD",
    "debito" => "Débito",
    "descricao"=>"Descrição",
    "emissao"=>"Emissão",
    "emprestimo"=>"Empréstimo",
    "fabricacao"=>"Fabricação",
    "formalizacao"=>"Formalização",
    "funcionario"=>"Funcionário",
    "funcionarios"=>"Funcionários",
    "historico"=>"Histórico",
    "imovel"=>"Imóvel",
    "indices"=>"Índices",
    "indice"=>"Índice",
    "liberacao"=>"Liberação",
    "liquido"=>"Líquido",
    "maximo"=>"Máximo",
    "minimo"=>"Mímino",
    "modulo"=>"Módulo",
    "movimentacao"=>"Movimentação",
    "nivel" => "Nível",
    "notificacao"=>"Notificação",
    "numero"=>"Número",
    "operacao"=>"Operação",
    "parent"=>"Pai",
    "parametros"=>"Parâmetros",
    "SAIDA" => "Saída",
    "situacao_estorno"=>"Situação Estorno",
    "subordinado_a"=>"Subordinado À",
    "TRANSFERENCIA" => "Transferência",
    "usuario"=>"Usuário",
    "utilitario"=>"Utilitário",
    "valor_a_atingir" => "Valor a Atingir",
    "valor_a_receber" => "Valor a Receber",
    "veiculo"=>"Veículo",
    "FISICA" => "Física",
    "JURIDICA" => "Jurídica",
    "grupo_de_funcionarios" => "Grupo de Funcionários",
    "grupos_de_funcionarios" => "Grupos de Funcionários",
    "CORTE_DE_COMISSAO" => "Corte de Comissão",
    "GRUPO_DE_OPERADORES" => "Grupo de Operadores",
    "OPERADOR_DA_PROPOSTA" => "Operador da Proposta"
  }
  
  def humanize
    HUMANIZES[self] || humanize_expressao || velho_humanize
  end

  def velho_humanize
    self.to_s.gsub(/_id$/, "").gsub(/_/, " ").capitalize
  end

  EXCECOES = %w(de da do das dos e)
  
  def abreviar_nomes_do_meio    
    
    self_em_array = self.split(" ")
    nova_string = self_em_array[0] + " "
    1.upto(self_em_array.length - 2) do |i|
      nova_string += EXCECOES.include?(self_em_array[i]) ? self_em_array[i] + " " : self_em_array[i][0..0] + ". "
    end
    nova_string << self_em_array.last
    nova_string
  end
  
  def abreviar_tirando_nomes_do_meio
    self_em_array = self.split(" ")
    nova_string = self_em_array[0] + " "
    nova_string += self_em_array[self_em_array.length - 2] + " " if EXCECOES.include?(self_em_array[self_em_array.length - 2])
    nova_string += self_em_array.last
    nova_string
  end
  
  def inteiro?
    self.strip.match(/^\d*$/)
  end
  
  def para_valor
    self.gsub(/\./, "").gsub(",", ".")
  end
  
  def mascara(mascara)
    return self if self.blank?

    mascaras_padrao = {
      :cpf => "###.###.###-##",
      :cnpj => '##.###.###/####-##',
      :telefone => "(##) ####-####",
      :cep => "##.###-###",
      :data => "##/##/####"
    }

    if mascara.kind_of?(Symbol)
      if mascaras_padrao.has_key?(mascara)
        mascara = mascaras_padrao[mascara]
      end
    end

    quantas_cerquilhas = mascara.gsub(/[^#]/,"").length
    retorno = self

    #    if quantas_cerquilhas > retorno.size
    #      retorno = retorno.com_zeros_a_esquerda(quantas_cerquilhas)
    #    end

    campo_mascarado = ""

    indice_campo = 0
    (0...mascara.length).each do |indice|
      caracter = mascara[indice].chr
      unless caracter == "#"
        campo_mascarado << caracter
      else
        break if retorno[indice_campo].blank?
        campo_mascarado << retorno[indice_campo]
        indice_campo += 1
      end
    end
    campo_mascarado
  end

  def remover_mascara(caracteres)
    caracteres_padrao = {
      :cpf => ".-",
      :cnpj => './-',
      :telefone => "() -",
      :cep => ".-",
      :data => "//"
    }

    if caracteres.is_a?(Symbol)
      caracteres = caracteres_padrao[caracteres]
    end

    self.delete caracteres
  end

  def com_zeros_a_esquerda(quantidade)
    return self if (quantidade-self.length) <= 0
    "0"*(quantidade-self.length) << self
  end
  
  private
  
  def humanize_expressao
    self_humanizado = self.dup.gsub(/_id$/, "").underscore
    palavras = self_humanizado.split("_")
    self_humanizado.gsub!("_", " ")
    palavras.each do |palavra|
      if HUMANIZES[palavra]
        self_humanizado.gsub!(palavra, HUMANIZES[palavra])
      else
        self_humanizado.gsub!(palavra, palavra.velho_humanize)
      end
    end
    self_humanizado
  end
end