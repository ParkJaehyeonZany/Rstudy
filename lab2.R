#문제1
v <- seq(10, 38, 2)
m1 <- matrix(v, nrow=3, ncol=5, byrow=T)
m2 <- m1 * 100
m_max_v <- max(m1)
m_min_v <- min(m1)
row_max <- apply(m1, 1, max)
col_max <- apply(m1, 2, max)
m1;m2;m_max_v;m_min_v;row_max;col_max

#문제2
n1 <- c(1,2,3)
n2 <- c(4,5,6)
n3 <- c(7,8,9)
m2 <- cbind(n1,n2,n3)
m2

#문제3
(m3 <- matrix(1:9, nrow=3, byrow=T))


#문제4
m4 <- m3
rownames(m3) <- c("row1","row2","row3")
colnames(m3) <- c("col1","col2","col3")
m4

#문제5
alpha <- matrix(letters[1:6], nrow=2)
alpha2 <- rbind(alpha, sort(rev(letters)[1:3]))
alpha3 <- cbind(alpha, c("s","p"))

#문제6
a <- array(1:24, dim=c(2,3,4))
a[2,3,4]
a[2,,]
a[,1,]
a[,,3]
a + 100
a[,,4] * 100
a[1,2:3,]
a[2,,2] <- a[2,,2] + 100
a[,,1] <- a[,,1] - 2
a <- a * 10
rm(a)