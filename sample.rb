
class Player
  def hand
    while true
      inds = [ "数字を入力してください。",
                "0: グー",
                "1: チョキ",
                "2: パー"
              ]
              
      inds.each do |ind|
        puts ind
      end
      # コンソールを入力待ち状態にし、
      #プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
       myhand = gets.chomp
       puts myhand
         if myhand == '0' || myhand == '1'|| myhand == '2'
           return myhand.to_i
         else
           puts "0~2を入力してください。"
         end
      end
    end
  end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    enemyhand = rand(0..2)
    enemyhand
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、
    # その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    # while player.hand == enemy.hand && Player.hand >= 3
    if player_hand < 0 || player_hand > 2
      puts "０−２の数字を入力してください。"
      player = Player.new
      # puts player.hand
      # enemy = Enemy.new
      janken = Janken.new
      janken.pon(player.hand, enemy_hand)

    elsif (player_hand - enemy_hand + 3) % 3 == 2 #勝利条件 （自分の手 - 相手の手 + 3）% 3
        puts "相手の手は#{enemy_hand}です。あなたの勝ちです。"
      elsif (player_hand - enemy_hand + 3) % 3 == 1
        puts "相手の手は#{enemy_hand}です。あなたの負けです。"
      else (player_hand - enemy_hand + 3) % 3 == 0
        puts "相手の手は#{enemy_hand}です。あいこです。"
        player = Player.new
         enemy = Enemy.new
        janken = Janken.new
        janken.pon(player.hand, enemy.hand)
      end
     end
   end

player = Player.new
# puts player.hand
 enemy = Enemy.new
 #puts enemy.hand
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
  janken.pon(player.hand, enemy.hand)


# ここに書かれているRubyの記述はあくまでヒントとして用意された雛形なので、
#書かれている記述に従わずに実装したいという場合は、自分の好きに実装して構わない。
#課題要件を満たし、コードの品質が一定の水準にあると判定されればどのような実装でも合格になる。
