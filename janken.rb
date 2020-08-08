# プレイヤー(自分)に「0 ~ 2」を入力させるロジックを書きます。
class Player
    def hand
        puts "数字を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
        input_hand = gets.to_i
        # 出した手が0-2以外の場合は繰り返す
        while input_hand != 0 || input_hand != 1 || input_hand != 2
            # 条件を書く (「input_hand」(取得した値)が「0, 1, 2」のいずれかの場合だった場合)
            if input_hand == 0 || input_hand == 1 || input_hand == 2
                # 「input_hand」(取得した値)をそのまま返します。
                return input_hand
            else
                # 「プレイヤーに 0 ~ 2を入力させる文章」を表示させます。
                puts "もう一度数字を入力してください。"
                puts "0:グー, 1:チョキ, 2:パー"
                input_hand = gets.to_i
            end
        end
    end
end

# 敵が「0 ~ 2」の値をランダムで生成するロジックを書きます。
class Enemy
    def hand
        return rand(3)
    end
end

# プレイヤー(自分)が入力した「0 ~ 2」と、敵がランダムで生成した「0 ~ 2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
class Janken
    def pon(player_hand, enemy_hand)
        janken = ["グー", "チョキ", "パー"]
        puts "相手の手は#{janken[enemy_hand]}です。"
        # 出した手の値が一緒の場合はあいこ
        if player_hand == enemy_hand
            puts "あいこ"
            return true
        elsif (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
            puts "あなたの勝ちです"
            return false
        else
            puts "あなたの負けです"
            return false
        end
    end
end

# 変数「player」にPlayerをインスタンス化したものを代入します。
player = Player.new
# 変数「enemy」にEnemyをインスタンス化したものを代入します。
enemy = Enemy.new
# 変数「janken」にJankenをインスタンス化したものを代入します。
janken = Janken.new
# 変数「next_game」に「true」を代入します。※「next_game」が「false」にならない限り、永久にwhileで繰り返し処理を実行するためです。
# 以降の型の例に沿って実装しましょう ※実装する時場合はコメントアウトに注意しましょう。
next_game = true
while next_game
    next_game = janken.pon(player.hand, enemy.hand)
end